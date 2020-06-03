class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :update, :destroy]
  before_action :check_access, only: [:create]
  before_action :check_tweet_access, only: [:update, :destroy]


  # GET /tweets
  def index
    colleuges = @current_user.get_colleagues.pluck(:id)
    @tweets = Tweet.from_colleuges(colleuges)

    render json: @tweets
  end


  def create
    @tweet = @current_user.tweets.new(tweet_params)
    if @tweet.save
      render json: @tweet, status: :created, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end


  def update
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @tweet.destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a trusted parameter.
  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def check_access
    unauthorised if @current_user.is_admin?
  end

  def check_tweet_access
    unauthorised unless @current_user.can_perform_action?(@tweet)
  end

  def unauthorised
    render json: { error: 'Not Authorized' }, status: 401
  end

end
