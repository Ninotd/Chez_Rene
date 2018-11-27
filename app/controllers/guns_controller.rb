class GunsController < ApplicationController
  before_action :set_gun, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @guns = policy_scope(Gun).order(created_at: :desc)
  end

  def new
    @gun = Gun.new
  end

  def show
    authorize @gun
  end

  def create
    @gun = Cocktail.new(gun_params)
    @gun.user = @user
    if @gun.save
      redirect_to gun_path(@gun)
    else
      render :new
    end
  end

  def edit
    authorize @gun
  end

  def update
    authorize @gun
    @gun.update(gun_params)
    if @gun.save?
      redirect_to gun_path(@gun)
    else
      render :new
    end
  end

  def destroy
    authorize @gun
    @gun.destroy
    redirect_to guns_path
  end

  private

  def set_gun
    @gun = Gun.find(params[:id])
  end

  def gun_params
    params.require(:gun).permit(:name, :category, :description, :price, :year_of_production)
  end
end
