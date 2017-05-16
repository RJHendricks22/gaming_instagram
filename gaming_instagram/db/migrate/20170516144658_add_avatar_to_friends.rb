class AddAvatarToFriends < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :pictures, :avatar
  end

  def self.down
    remove_attachment :pictures, :avatar
  end
end
