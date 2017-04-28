class AddAttachmentAvatarToCounselors < ActiveRecord::Migration
  def self.up
    change_table :counselors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :counselors, :avatar
  end
end
