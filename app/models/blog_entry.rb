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
#

class BlogEntry < ActiveRecord::Base
  self.table_name = "blog_entries"

  def empty?
    title.blank? &&
    body.blank? &&
    ip.blank?
  end
end

