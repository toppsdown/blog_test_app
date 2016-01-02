class AddCommentsToBlogEntry < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.belongs_to :user
      t.belongs_to :blog_entry
      t.text :body

      t.timestamps
    end
  end
end
