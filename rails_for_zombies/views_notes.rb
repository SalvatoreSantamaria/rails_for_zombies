#views

#visual represenation in the app

#main_application_folder
#app folder has models
#under app folder, there is views folder

# zombie_twitter
#     app
#         views
#             zombies
#             layouts
#                 application.html.erb (main layout)
#             tweets
#                 index.html.erb #list of all tweets (erb is embedded ruby)
#                 show.html.erb #view a single tweet

#example

#Boilerplate code would go to /app/views/layouts/application.html.erb
# code will appear under 
# <%yield%>

# Links:
# <%= link_to tweet.zombie.name, zombie_path(tweet.zombie) %> 
# alternate syntax
# <%= link_to tweet.zombie.name, tweet.zombie %> 

# <% tweet = Tweet.find(1) %>
# <h1><% = tweet.status %></h1>
# <p> Posted by <%tweet.zombie.name%></p>

#looping through tweets
#/app/views/tweets/index.html.erb
# <h1>Listing Tweets</h1>
# <table>
#     <tr>
#         <th>Status</th>
#         <th>Zombie</th>
#     </tr>
#     <% tweets_var = Tweet.all %> ß
#     <% tweets_var.each do |tweet| %> #Tweet.all is an array of tweets. tweet is a single tweet
#     <tr>
#         <td><% = tweet.status %> </td> 
#         <td><% = tweet.zombie.name %> </td>
#with links
#         <td><% = link_to tweet.status, tweet %> </td>
#         <td><% = link_to tweet.zombie.name, tweet.zombie %> </td>
#         <td><% = link_to "Edit", edit_tweet_path(tweet) %> </td> #edit path
#         <td><% = link_to "Destroy", tweet, method: :delete %> </td> # delete path #hash symbol key is method:, hash symbol value is :delete
#     </tr>
# <& end &>
    # <% if tweets.size == 0 %> #if no tweets are found
    #     <em>No Tweets Found</em>
    # <% end% >
# </table>

#action# 
#list all tweets
#code# tweets_path
#url# /tweets

#action#
#new# tweet form
#code# new_tweet_path
#url# /tweets/new

#action#
#show# a tweet 
#code# tweets
#url# /tweets/1

#action# edit a tweet
#code# edit_tweet_path(tweet)
#url# /tweets/1/edit

#action# delete a tweet
#code# tweet, method: :delete
#url# /tweets/1

#remember links example <%= link_to text_to_show, code %>



