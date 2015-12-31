class AddBlogEntryTable < ActiveRecord::Migration
  def change
    create_table :blog_entries do |t|
      t.string :title
      t.text :body
      t.string :ip

      t.timestamps
    end
  end
end
