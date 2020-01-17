class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  # GET /topics
  def index
    @topics = Topic.all
    json_response(@topics)
  end

  # GET /todos/:id
  def show
    json_response(@topic)
  end

  private

  def todo_params
    # whitelist params
    params.permit(:name)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
