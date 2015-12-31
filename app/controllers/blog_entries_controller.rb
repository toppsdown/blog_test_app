class BlogEntriesController < ApplicationController
  def index
    # list blog entries
    @entries = BlogEntry.all

    render :index
  end
end
