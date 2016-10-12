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
      redirect_to edit_topic_path(@topic), notice: 'Тема успешно создана'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to edit_topic_path(@topic), notice: 'Тема успешно изменена'
    else
      render :edit
    end
  end

  def destroy
    @topic.delete
    redirect_to :back, notice: 'Тема успешно удалена'
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :color, :description)
    end
end
