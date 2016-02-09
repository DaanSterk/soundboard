class AddEditModeToBoard < ActiveRecord::Migration
  def change
    add_column(:boards, :isInEditMode, :boolean)
  end
end
