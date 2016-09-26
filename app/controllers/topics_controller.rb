class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = current_user.topics
  end

  def new
    @topic = current_user.topics.build
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      redirect_to @topic, notice: 'Topic was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @topic.delete
    redirect_to topics_path, notice: 'Topic was successfully destroyed.'
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end
