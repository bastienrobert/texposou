class AddAttachmentFileUsrToListings < ActiveRecord::Migration
  def self.up
    change_table :image_users do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :image_users, :file
  end
end
