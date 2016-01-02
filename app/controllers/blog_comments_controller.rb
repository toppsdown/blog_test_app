class BlogCommentsController < ApplicationController
  def new
    @comment = BlogComment.new
  end

  def create
    if user_signed_in?
      adjusted_params = blog_comments_params.merge!(blog_entry_id: params[:blog_entry_id])
      current_user.blog_comments.create(adjusted_params)

      redirect_to blog_entries_path
    else
      permission_denied
    end
  end

  private
  def blog_comments_params
    params.require(:blog_comment).permit(:body)
  end
end
