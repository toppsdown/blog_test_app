class AddLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.references :likeable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
