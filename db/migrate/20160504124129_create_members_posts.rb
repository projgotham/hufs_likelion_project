class CreateMembersPosts < ActiveRecord::Migration
  def change
    create_table :members_posts do |t|
      t.integer :user_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
