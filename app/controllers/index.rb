get '/' do
  erb :index
end

get '/twitter' do
  @username = User.find_or_create_by_username(params[:username])
  redirect to("/#{@username.username}")
end

# get '/:username' do
#   @tweets = Twitter.user_timeline(params[:username], :count => 10)
#   erb :tweets
# end

get '/:username' do
  @user = User.find_by_username(params[:username])
  p @user
  if @user.tweets.empty? || @user.tweets_stale?
     @user.fetch_tweets!
  end

  @tweets = @user.tweets.order("created_at DESC").limit(10)
  erb :tweets
end
  
