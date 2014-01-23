class PostsController < ApplicationController
  before_action :set_twitter_client

  def create
  end

  def index

  end

  def search
    @search = @client.user_search(params[:search], count: 50).collect 
    render :index
  end

  private
  def set_tweets
    # @tweets = client.user_timeline(<author>, :count =>10).collect  
  end

  def set_twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CLIENT_ID"]
      config.consumer_secret = ENV["TWITTER_CLIENT_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end
end