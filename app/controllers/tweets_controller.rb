class TweetsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update]

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    # authenticate_user
    @tweet = Tweet.new
  end

  def create
    # authenticate_user
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to tweet_path(@tweet)
    else
      render 'new'
    end
  end

  def edit
    # authenticate_user
    @tweet = Tweet.find(params[:id])
    unless @tweet.user == current_user
      redirect_to tweets_path and return
    end
  end

  def update
    # authenticate_user
    @tweet = Tweet.find(params[:id])
    unless @tweet.user == current_user
      redirect_to tweets_path and return
    end
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    else
      render 'edit'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end
