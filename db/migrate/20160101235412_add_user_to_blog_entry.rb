class AddUserToBlogEntry < ActiveRecord::Migration
  def change
    add_reference :blog_entries, :user, index: true, foreign_key: true
  end
end
