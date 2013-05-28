get '/' do
  erb :index
end

get '/twitter' do
  @username = User.find_or_create_by_username(params[:username])
  redirect to("/#{@username.username}")
end

get '/:username/fetch' do
  @username = User.find_or_create_by_username(params[:username])
  @username.fetch_tweets!

  # @username.tweets.order("created_at DESC").limit(10).to_json
  @tweets = @username.tweets.order("created_at DESC").limit(10)
  erb :_tweet_list, :layout => false
end

get '/:username' do
  @user = User.find_by_username(params[:username])
  if @user.tweets.empty? || @user.tweets_stale?
     @loading = true
     @user.fetch_tweets!
    # set var loading = true
    erb :tweets
  else
    @loading = false

    @tweets = @user.tweets.order("created_at DESC").limit(10)
    erb :tweets
  end
end



     
