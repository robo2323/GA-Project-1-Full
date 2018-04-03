class CreateCommentsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :comments_users, id: false do |t|
      t.integer :comment_id
      t.integer :user_id

    end
  end
end
