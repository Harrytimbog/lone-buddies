class BookingsController < ApplicationController
  def index
    @bookings = Booking.all.order(created_at: :desc)
  end

  def new
    @buddy = Buddy.find(params[:id])
    @booking = Booking.new
  end

  def create
    @buddy = Buddy.find(params[:id])
    @booking = Booking.new(booking_params)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on)
  end
end
