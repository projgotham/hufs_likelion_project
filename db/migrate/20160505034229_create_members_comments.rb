class CreateMembersComments < ActiveRecord::Migration
  def change
    create_table :members_comments do |t|
      t.integer :user_id
      t.integer :members_post_id
      t.text :comment_content

      t.timestamps null: false
    end
  end
end
