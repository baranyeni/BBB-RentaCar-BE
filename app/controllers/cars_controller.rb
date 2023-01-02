class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end
end