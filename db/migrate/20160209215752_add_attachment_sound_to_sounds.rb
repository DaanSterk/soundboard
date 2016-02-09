class AddAttachmentSoundToSounds < ActiveRecord::Migration
  def self.up
    change_table :sounds do |t|
      t.attachment :sound
    end
  end

  def self.down
    remove_attachment :sounds, :sound
  end
end
