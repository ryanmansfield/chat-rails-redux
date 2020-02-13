class Api::V1::MessagesController < ApplicationController
# class Api::V1::MessagesController < ActionController::Base
  before_action :set_channel

  def index
    messages = @channel.messages.order('created_at ASC')
    render json: messages
  end

  def create
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end

