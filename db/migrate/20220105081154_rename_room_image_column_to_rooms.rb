class RenameRoomImageColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :room_image, :room_image_id  
  end
end
