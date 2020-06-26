class BookingsController < ApplicationController
  def index
    @bookings = Booking.all.order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @buddy = Buddy.find(params[:buddy_id])
    @booking = Booking.new
  end

  def create
    @buddy = Buddy.find(params[:buddy_id])
    @booking = Booking.new(booking_params)
    @booking.buddy = @buddy
    @booking.user = current_user
    if @booking.save
      redirect_to buddy_path(@buddy)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on)
  end
end
