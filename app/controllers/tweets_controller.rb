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
    authenticate_user_tweet and return
  end

  def update
    # authenticate_user
    @tweet = Tweet.find(params[:id])
    authenticate_user_tweet and return
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    else
      render 'edit'
    end
  end

  private

  def authenticate_user_tweet
    unless @tweet.user == current_user
      flash[:notice] = 'You cannot edit this tweet'
      redirect_to @tweet
    end
  end

  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end
