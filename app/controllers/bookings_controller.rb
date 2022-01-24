class BookingsController < ApplicationController
  def index
    @user = current_user
    @bookings = Booking.all
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
  end

  def new
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    if @booking.start_day.nil? || @booking.end_day.nil?
      redirect_to @booking.room, notice: "日付を指定してください"
    elsif @booking.end_day < Date.today || @booking.start_day < Date.today
      redirect_to @booking.room, notice: "過去の日付は指定できません"
    elsif @booking.end_day < @booking.start_day
      redirect_to @booking.room, notice: "チェックインより後の日付を指定してください"
    elsif @booking.people == nil
      redirect_to @booking.room, notice: "人数を指定してください"
    else
      @booking.total_day = days
      @booking.total_amount = @booking.people * @booking.room.price * days.to_i
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    flash[:notice] = "部屋を予約しました"
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
