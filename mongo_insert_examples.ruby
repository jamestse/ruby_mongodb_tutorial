require "mongo"


client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'cl')
# or 
#client = Mongo::Client.new('mongodb://127.0.0.1:27017')


puts "list databases:"
puts "-----------------------------"
puts client.database_names
puts "-----------------------------"



collection = client["apt"]
url = "xasdasd"
area = "ssf"
title = "jamess house"
price = "$110000"
type = "1b/2br"

doc = { "url" => url, "area" => area, "info" => { "title" => title, "price" => price, "type" => type}}  


result = collection.insert_one(doc)
result.n # returns 1, because one document was inserted


# insert many example
# docs = [ { _id: 1, name: 'hank', hobbies: [ 'hiking', 'tennis', 'fly fishing' ] },
#         { _id: 2, name: 'Sally', hobbies: ['skiing', 'stamp collecting' ] } ]

#result = collection.insert_many(docs)
#result.inserted_count # returns 2 because two documents were inserted



# print info about sally
# puts collection.find( { name: 'Sally' } ).first

