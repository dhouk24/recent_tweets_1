class User < ActiveRecord::Base
  has_many :tweets

  def tweets_stale?
    last_tweet_pull = Tweet.where(:user_id => id).order("created_at DESC").first.created_at
    puts last_tweet_pull
    puts Time.now
    puts ((Time.now - last_tweet_pull)/60)
    ((Time.now - last_tweet_pull)/60/60) < 15
  end


  def fetch_tweets!
    timeline = Twitter.user_timeline(username, :count => 10)
    timeline.each do |tweet|
      Tweet.find_or_create_by_twitter_id(:twitter_id => tweet.id.to_s, :user_id => id, :tweet => tweet.text, :created_at => tweet.created_at)
    end
  end


  # include BCrypt

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(pass)
  #   @password = Password.create(pass)
  #   self.password_hash = @password
  # end

  # def self.create(params={})
  #   @user = User.new(:email => params[:email], :name => params[:name])
  #   @user.password = params[:password]
  #   @user.save!
  #   @user
  # end

  # def self.authenticate(params)
  #   user = User.find_by_name(params[:name])
  #   (user && user.password == params[:password]) ? user : nil
  # end
end
