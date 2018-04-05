class AddXYToPresets < ActiveRecord::Migration[5.1]
  def change
    add_column :presets, :x, :float
    add_column :presets, :y, :float
  end
end
