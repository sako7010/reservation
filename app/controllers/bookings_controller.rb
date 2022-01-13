class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
  end

  def new
  end

  def confirm
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.total_day = days
    @booking.total_amount = @booking.people * @booking.room.price * days.to_i
    @booking.save
  end

  def create
    @booking = Booking.new(booking_params)
    @room = Room.find(params[:id])
    @booking.room.id = @room.id
    @booking.save
    redirect_to booking_path(@booking)
  end

  private
  
  def booking_params
    params.require(:booking).permit(
      :user_id,
      :room_id, 
      :start_day,
      :end_day, 
      :people,
      :total_amount,
    )
  end

  def days
    @booking.end_day - @booking.start_day
  end
end
