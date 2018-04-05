class AddSettingsToPresets < ActiveRecord::Migration[5.1]
  def change
    add_column :presets, :color_1, :string
    add_column :presets, :color_2, :string
    add_column :presets, :color_3, :string
    add_column :presets, :color_4, :string
    add_column :presets, :bg_color, :string
    add_column :presets, :seeds, :integer
    add_column :presets, :angle, :float
    add_column :presets, :zoom, :float
    add_column :presets, :opacity, :integer
    add_column :presets, :b1, :integer
    add_column :presets, :b2, :integer
    add_column :presets, :b3, :integer
    add_column :presets, :b4, :integer
    add_column :presets, :b5, :integer
  end
end
