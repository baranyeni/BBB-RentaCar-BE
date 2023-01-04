class RentalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rentals = Rental.where(user_id: current_user.id)
  end

  def create
    @car = Car.find(params[:car_id])
    @rental = Rental.create!(
      start_date: DateTime.strptime(rental_params[:start_date], "%d/%m/%Y"),
      end_date: DateTime.strptime(rental_params[:end_date], "%d/%m/%Y"),
      user_id: current_user.id,
      car_id: @car.id
    )
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end