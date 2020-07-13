class PostsController < ApplicationController
  before_action :set_discussion

  # GET /discussions/:discussion_id/posts
  def index
    json_response(@discussion.posts.order('created_at ASC'))
  end

  # POST /discussions/:discussion_id/posts
  def create
    @discussion.posts.create!(post_params)
    json_response(@discussion, :created)
  end

  private

  def post_params
    params.permit(:author, :message)
  end

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end
end
