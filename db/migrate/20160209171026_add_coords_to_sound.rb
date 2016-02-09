class AddCoordsToSound < ActiveRecord::Migration
  def change
    add_column(:sounds, :xPos, :integer)
    add_column(:sounds, :yPos, :integer)
  end
end
