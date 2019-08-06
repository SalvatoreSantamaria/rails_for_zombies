 ZombieTwitter::Application.routes.draw do 
    resources :tweets #creating a RESTful resourse
    get 'new_tweet' => 'tweets#new' # path => 'tweets#new' #controller is 'tweets' #action is 'new'  
 end

 zombie_twitter
    config
        routes.rb

#/config/routes.rb

#Named Routes
#to get http://localhost:3000/all to render the same as http://localhost:3000/tweets
#controller name is Tweets
#action name is index

#for custom routes
# /config/routes.rb
# get '/all' => 'tweets#index', as: 'all_tweets' #named route
# <% link_to "All Tweets", all_tweets_path %> #for custom routes

#for redirects
#localhost:3000/all to redirect to localhost/3000 tweets
get '/all' => redirect('/tweets')

#can also redirect URLs
get '/google' => redirect('http://www.google.com/')

#root route
root to: "tweets#index" #controller is tweets and action is index

#route params
#/app/controllers/tweets_controller.rb
#example: trying to find all tweets in this zip code /local_tweets/98092
def index
 if params[:zipcode]
    @tweets = Tweet.where(zipcode: params[:zipcode])
 else
    @tweets = Tweet.all 
 end
    respond_to do |format|
    format.html # index.html.erb
    format.xml {render xml: @tweets}
end

#to make this route work:
#inside the routing file
get 'local_tweets/:zipcode' => 'tweets#index' #:zipcode is referenced by the params[:zipcode] in the controller
#pointing to the tweets controller, index action

#to name the above route
get '/local_tweets/:zipcode'
    => 'tweets#index', as: 'local_tweets'

<%= link_to "Tweets in 98092", local_tweets_path(98092)

#add route at bottom of file, to create routes params link /sam and have all the tweets from sam
get ':name' => 'tweets#index', as: 'zombie_tweets'
<% link_to "sam", zombie_tweets_path('sam')
#then would have to add to app/controllers/tweets_controller.rb
def index
    if params[:name] #if there is a param called name
        @zombie = Zombie.where(name: params[:name]).first #if yes run this
        @tweets = @zombie.tweets set tweets to zombie.tweets
    else
        @tweets = Tweet.all 
    end
end



