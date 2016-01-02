# == Schema Information
#
# Table name: blog_entries
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  ip         :string
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#
# Indexes
#
#  index_blog_entries_on_user_id  (user_id)
#

class BlogEntry < ActiveRecord::Base
  self.table_name = "blog_entries"

  belongs_to :user

  has_many :blog_comments
  has_many :likes, as: :likeable

  def empty?
    title.blank? &&
    body.blank? &&
    ip.blank?
  end
end

