Request /tweets/1

/app/controllers/tweets_controller.rb
class TweetsController < ApplicationController
    def show #maps to the view show.html.erb
        #@tweet = Tweet.find(1)
        @tweet = Tweet.find(params[:id]) # should use it with params
        #render action: 'status' if we want the mapping to render elsewhere and NOT the default show.html.erb
    end
end


/app/view/tweets/show.html.erb

<h1><% = @tweet.status %></h1>
<p> Posted by <% @tweet.zombie.name %></p>

@ grants view access to instance variables

parameters notes

/tweets?status=I'm dead
params = { status: "I'm dead"}
@tweet = Tweet.create(status: prams[:status])

/tweets?tweet[status]=I'm dead
params = {tweet: {status: "I'm dead"}}
@tweet = Tweet.create(status: params[:tweet][:status])
alternate (better) syntax
@tweet = Tweet.create(params[:tweet])

@tweet = Tweet.create(params.require(:tweet.permit(:status))
#if there were multiply things to permit, we could use an array
params.require(:tweet).permit([:status, :location]) 
#requre(:tweet) #need to specify the param key we re quire
#permit(:status) #need to specify the attributes we will permit to be set

#repsonding with XML or JSON?
/tweets/1.json || tweets/1.xml
class TweetsController < ApplicationController
    def show
        @tweet = Tweet.find(params[:id])
        respond_to |format| #tell rails app what format to repsond to
            format.html #show.html.erb #repsonds to format of html
            format.json {render json: @tweet}
            format.xml {render xml: @tweet}
        end
    end
end

#controller actions
class TweetsController < ApplicationController 
    def index
    def show
    def new
    def edit
    def create
    def update
    def destroy
end

#Redirect and Flash
/app/controllers/tweets_controller.rb

class TweetsController < ApplicationController
    def edit 
        @tweet = Tweet.find(params[:id])
        if session[:zombie_id] != @tweet.zombie_id
            flash[:notice] ="Sorry, you can't edit this tweet" #to send messages to user
            redirect_to(tweets_path) #to redirect the request
            #alternate
            redirect_to(tweets_path,
                notice: "Sorry, you can't edit this tweet")

        end
    end
end

#flash gets added like this
/app/views/layouts/application.html.erb
<body>
    <% if flash[:notice] %>
        <div id ="notice"><%= flash[:notice] %></div>
    <% end %>

    <%= yield %>
</body>

#
/app/controllers/tweets_controller.rb
class TweetsController < ApplicationController
    before_action :get_tweet, only: [:edit, :update, :destroy]
    def get_tweet
        @tweet = Tweet.find(params[:id]) #define method to get tweet
    end
    def edit
    end
    def update
    end
    def destroy
    end
end
