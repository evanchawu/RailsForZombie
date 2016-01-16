class TweetsController < ApplicationController
	before_action :find_zombie #Tweets裡面對所有action都跟zombie有過關聯，所以先找到zombie
	before_action :find_tweet, only: [:show, :edit, :update, :destroy]



	#get zombies/zombie_id/tweets/id
	def show
		
	end

	#get zombies/zombie_id/tweets
	def index
		@tweets = @zombie.tweets
	end

	#get zombies/zombie_id/tweets/new
	def new
		@tweet = Tweet.new
	end

	#get zombies/zombie_id/tweets/id/edit
	def edit
		
	end

  #post zombies/zombie_id/tweets
	def create
		@tweet = @zombie.tweets.new set_tweet_params
		if @tweet.save 
			redirect_to [@zombie,@tweet], notice: "successful create!"
		else
			render :new
		end
	end

	#put zombies/zombie_id/tweets/id
	def update
		if @tweet.update set_tweet_params
			redirect_to [@zombie,@tweet], notice: "successful updated!"
		else
			render :edit
		end
	end

	#delete zombies/zombie_id/tweets/id
	def destroy
		@tweet.destroy
		redirect_to zombie_tweets_path
	end

	private

	def find_zombie
		@zombie = Zombie.find(params[:zombie_id]) 
	end

	def find_tweet
		@tweet = @zombie.tweets.find(params[:id])#要先.tweets才能.find
	end

	def set_tweet_params
		params.require(:tweet).permit(:status)
	end
end