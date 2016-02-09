class AddForeignKeyToSound < ActiveRecord::Migration
  def change
    add_column(:sounds, :board_id, :integer)
  end
end
