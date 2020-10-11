class TopicsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :current_topic, only: %i[show update destroy]
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    @pagy, @topics = pagy(Topic.all)
    filtering_params.each do |key, value|
      @topics = @topics.public_send("filter_by_#{key}", value) if value.present?
    end
    render json: @topics , adapter: :json
  end

  def show    
    render json: @topic, adapter: :json
  end

  def create
    topic = current_user.authored_topics.new(topic_params)
    if topic.save
      render json: topic, adapter: :json, status: 201
    else
      render json: topic.errors, status: 422
    end
  end

  def update
    if @topic.update(topic_params)
      render json: @topic, adapter: :json, status: 200
    else
      render json: @topic.errors, status: 422
    end
  end

  def destroy
    @topic.destroy
    head 204
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :preview, :image, :body, :tags)
  end

  def current_topic
    @topic = params[:id].present? ? Topic.find(params[:id]) : Topic.find_by(link: "/#{params[:link]}.#{params[:format]}")
  rescue ActiveRecord::RecordNotFound
    head 204
  end

  def filtering_params
    params.slice(:asc, :desc, :heading, :ids, :tag)
  end
end
