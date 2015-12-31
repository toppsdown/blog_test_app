class BlogEntriesController < ApplicationController
  def index
    # list blog entries
    @entries = BlogEntry.all

    render :index
  end

  def new
    @entry = BlogEntry.new
  end

  def create
    entry = BlogEntry.new(blog_entry_params)
    entry.save!

    redirect_to action: "index"
  end

  private
  def blog_entry_params
    params.require(:blog_entry).permit(:title, :body).merge({ip: request.remote_ip})
  end
end
