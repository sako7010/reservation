class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = Room.all
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @room.user_id = current_user
    @booking = Booking.new
    @booking.room_id = @room.id 
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    @room.save
    redirect_to room_path(@room)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  private
  def room_params
    params.require(:room).permit(
      :room_name,
      :room_introduction,
      :price,
      :address,
      :room_image,
    )
  end
end
