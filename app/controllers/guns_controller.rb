class GunsController < ApplicationController
  before_action :set_gun, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]
  skip_after_action :verify_authorized, only: [ :mygun, :destroy, :edit, :update ]

  def index
    @guns = policy_scope(Gun).order(created_at: :desc)
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
      redirect_to monprofil_guns_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @gun.update(gun_params)
    if @gun.save
      redirect_to monprofil_guns_path
    else
      render :new
    end
  end

  def destroy
    @gun.destroy
    redirect_to monprofil_guns_path
  end

  def mygun
    @guns = current_user.guns
  end

  private

  def set_gun
    @gun = Gun.find(params[:id])
  end

  def gun_params
    params.require(:gun).permit(:name, :category, :description, :price, :year_of_production)
  end
end
