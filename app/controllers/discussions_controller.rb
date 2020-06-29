class DiscussionsController < ApplicationController
  before_action :set_topic
  before_action :set_topic_discussion, only: [:show, :destroy]

  # GET /topics/:topic_id/discussions
  def index
    # json_response(@topic.discussions)
    @topic = Topic.find(params[:topic_id])
    @discussions = @topic.discussions.order('created_at DESC')
    @paginated_discussions = @discussions.paginate(page: params[:page], per_page: 10)
    json_response(@paginated_discussions)
  end

  # GET /topics/:topic_id/discussions/:id
  def show
    json_response(@discussion)
  end

  # POST /topics/:topic_id/discussions
  def create
    @topic.discussions.create!(discussion_params)
    json_response(@topic, :created)
  end

  def destroy
    @discussion.destroy
    head :no_content
  end

  private

  def discussion_params
    params.permit(:author, :title, :message)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_topic_discussion
    @discussion = @topic.discussions.find_by!(id: params[:id]) if @topic
  end
end
