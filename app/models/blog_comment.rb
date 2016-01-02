# == Schema Information
#
# Table name: blog_comments
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  blog_entry_id :integer
#  body          :text
#  created_at    :datetime
#  updated_at    :datetime
#

class BlogComment < ActiveRecord::Base
  self.table_name = "blog_comments"

  belongs_to :user
  belongs_to :blog_entry

  has_many :likes, as: :likeable
end
