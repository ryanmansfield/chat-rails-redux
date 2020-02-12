class Api::V1::MessagesController < ApplicationController
  before_action :set_channel
  def index
    messages = Message.order(created_at: :desc)
    render json: messages
  end

  def create
  end

  private

  def set_channel
    @channel = Channel.find_by_name(params[:name])
  end
end
