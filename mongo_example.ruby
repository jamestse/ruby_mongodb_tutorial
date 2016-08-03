require "mongo"


# Connect to client running on localhost:27017 and databse cl
client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'cl')
# Or 
#client = Mongo::Client.new('mongodb://127.0.0.1:27017')


# Dump databases on mongo instance
puts "list databases:"
puts "-----------------------------"
puts client.database_names
puts "-----------------------------"


# Create 'apt' collection
collection = client["apt"]



# Create example dictionary
# looks like this in json:
# {
#   "url" : "a",
#   "area" : "b",
#   "info" : {
#     title : "c",
#     price : "d",
#     type : "e"
#   }
# }


url = "xasdasdkt"
area = "ssf"
title = "jamess house"
price = "$110000"
type = "1b/2br"
doc = { "url" => url, "area" => area, "info" => { "title" => title, "price" => price, "type" => type}}  

# Insert to collection
result = collection.insert_one(doc)
result.n # returns 1, because one document was inserted

# Insert only unqiue values based on key - "url"
puts "-----------------------------"
result = collection.update_one( {"url" => url}, doc, {upsert:true})
puts "-----------------------------"



# Dump info 
puts collection.find( { url: url } ).first

# Dump the entire collection
puts "-----------------------------"
collection.find().each do | rec |
	puts rec
end
puts "-----------------------------"


#
# Extra examples
#

# insert many example
# docs = [ { _id: 1, name: 'hank', hobbies: [ 'hiking', 'tennis', 'fly fishing' ] },
#         { _id: 2, name: 'Sally', hobbies: ['skiing', 'stamp collecting' ] } ]

#result = collection.insert_many(docs)
#result.inserted_count # returns 2 because two documents were inserted



# print info about sally
# puts collection.find( { name: 'Sally' } ).first

