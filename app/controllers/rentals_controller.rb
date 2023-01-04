class RentalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rentals = Rental.where(user_id: current_user.id)
  end

  def create
    Rails.logger.info(params.inspect)
    @car = Car.find(params[:car_id])
    @rental = Rental.create!(rental_params.merge(user_id: current_user.id))
  end

  private

  def rental_params
    params.permit(:start_date, :end_date, :car_id)
  end
end