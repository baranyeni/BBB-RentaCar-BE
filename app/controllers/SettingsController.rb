class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @locations = Location.all
    @colors = Color.all
    @brands = Brand.all
  end

  def create_location
    @location = Location.new(location_params)
    if @location.save
      render :create_location
    else
      render_errors(@location)
    end
  end

  def create_color
    @color = Color.new(color_params)
    if @color.save
      render :create_color
    else
      render_errors(@color)
    end
  end

  def create_brand
    @brand = Brand.new(brand_params)
    if @brand.save
      render :create_brand
    else
      render_errors(@brand)
    end
  end

  def create_car
    @car = Car.new(car_params)
    if @car.save
      params[:car][:picture_urls].each { |url| CarPicture.create(car: @car, url: url) }
      render :create_car
    else
      render_errors(@car)
    end
  end

  private

  def render_errors(model)
    render json: { errors: model.errors.full_messages }, status: :unprocessable_entity
  end

  def location_params
    params.require(:location).permit(:city, :address)
  end

  def color_params
    params.require(:color).permit(:name, :hex)
  end

  def brand_params
    params.require(:brand).permit(:name, :logo_url)
  end

  def car_params
    params.require(:car).permit(:plate_number, :description, :availability, :fuel_type, :gear_type,
                                :price_per_day, :price_per_month, :price_per_year, :color_id, :location_id, :brand_id,
                                :year, :kilometer, :model, :model_year)
  end

  def check_admin
    render json: { errors: ['You are unallowed for this action.'] }, status: :unprocessable_entity unless current_user.admin?
  end
end