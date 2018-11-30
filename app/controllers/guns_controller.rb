class GunsController < ApplicationController
  before_action :set_gun, only: [:show, :edit, :update, :destroy]
  before_action :current_user_guns, only: [:monprofil]
  skip_before_action :authenticate_user!, only: [:show, :index, :topguns]
  skip_after_action :verify_authorized, only: [ :monprofil, :destroy, :edit, :update, :topguns ]

  def index
    @guns = policy_scope(Gun).order(created_at: :desc)

    @guns = Gun.where.not(latitude: nil, longitude: nil)
    @guns = @guns.global_search(params[:query]) if params[:query].present?

    @markers = @guns.map do |gun|
      {
        lng: gun.longitude,
        lat: gun.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { gun: gun })
      }
    end
  end

  def new
    @gun = Gun.new
    @gun.user = current_user
    authorize @gun
  end

  def show
    authorize @gun
  end

  def create
    @gun = Gun.new(gun_params)
    @gun.user = current_user
    authorize @gun
    if @gun.save
      redirect_to monprofil_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @gun.update(gun_params)
    if @gun.save
      redirect_to monprofil_path
    else
      render :new
    end
  end

  def destroy
    @gun.destroy
    redirect_to monprofil_path
  end

  def monprofil
    @my_rentings = current_user.bookings
    if current_user.guns
      @my_bookings = current_user.guns.map { |gun| gun.bookings }.flatten
      reviews = @my_bookings.map do |booking|
        booking.booking_reviews
      end
      @my_reviews = reviews.flatten
    end
    @count_bookings_unanswered = count_bookings(@my_bookings)
  end

  def topguns
    @topguns = Gun.first(3)
  end

  private

  def set_gun
    @gun = Gun.find(params[:id])
  end

  def current_user_guns
    @guns = current_user.guns
  end

  def gun_params
    params.require(:gun).permit(:name, :category, :description, :price, :year_of_production, :address, :photo)
  end

  def count_bookings(array)
    count = 0
    array.each do |element|
      if element.confirmed == "En attente"
        count += 1
      end
    end
    return count
  end
end
