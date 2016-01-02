class BlogEntriesController < ApplicationController
  def index
    # list blog entries
    @entries = BlogEntry.all

    render :index
  end

  def new
    if user_signed_in?
      @entry = BlogEntry.new
    else
      permission_denied
    end
  end

  def create
    if user_signed_in?
      current_user.blog_entries.create(blog_entry_params)

      redirect_to action: "index"
    else
      permission_denied
    end
  end

  private
  def blog_entry_params
    params.require(:blog_entry).permit(:title, :body).merge({ip: request.remote_ip})
  end
end
