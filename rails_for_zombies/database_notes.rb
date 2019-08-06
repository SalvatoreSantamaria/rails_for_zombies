#Module 1: #database

#id, status, zombie

#hashes
b = { 
    some_key: "This is some value",
    id: 3, 
    status: "This is the value",
    zombie: "This is another value"
}

puts b[:some_key] #will return this is some value


#syntax 
#variable[:key] => value

#db query for retrieving
# t = Tweet.find(3) #this would access the tweets table (which will always be lowercase and pluralize)
# would return 
# { id: 3,
#   status: "some status text here",
#   zombie: "Jim"
# }


#now can access t
# puts t.id
# puts t.status
# puts t.zombie

# Create
# t = Tweet.new
# t.status = "Some status here!"
# t.save

# Alternate syntax
# t = Tweet.new(
#     status = "Some status here!"
#     zombie = "Some zombie"
#     )
# t.save

# Alternate syntax
#     Tweet.create(status: "some status here!", zombie: "Some zombie")

# Read
# Tweet.find(3)
# can submit multiple, which will return an array
# some methods .first, .last, .all, .count, .order(), limit(10) where(zombie: "Zombie2")
 
# Update
# t = Tweet.find(3)
# t.zombie = "Some zombie"
# t.save 

# Alternate syntax
# t = Tweet.find(2)
# t.attributes = {
#     status: "Updated status",
#     zombie: "Zombie3"
#     }
# t.save

# Alternate syntax
# t = Tweet.find(2)
# t.update(
#     status: "Updated status",
#     zombie: "Zombie3"
#     )

# Delete
# t = Tweet.find(3)
# t.destroy

# Alternate syntax
# Tweet.find(2).destory

#______________________________________________________________________
