class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Topic.all
  end

  def show
    render json: Topic.find(params[:id])
  end
end
