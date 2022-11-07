class AddIsClosedToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :is_closed, :bool, default: false
  end
end
