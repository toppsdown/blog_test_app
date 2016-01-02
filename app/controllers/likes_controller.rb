class LikesController < ApplicationController
  def create
    if user_signed_in?
      if (comment_id = params[:blog_comment_id])
        likeable_object = BlogComment.find(comment_id)
      elsif (entry_id = params[:blog_entry_id])
        likeable_object = BlogEntry.find(entry_id)
      end
      likeable_object.likes.create(user: current_user)
    else
      permission_denied
    end
  end
end
