class CreateCommentsPresets < ActiveRecord::Migration[5.1]
  def change
    create_table :comments_presets, id: false do |t|
      t.integer :comment_id
      t.integer :preset_id

    end
  end
end
