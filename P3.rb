#Tran Minh Tu

require 'net/http'
require 'json'

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response) # converts the JSON-formatted string in the response variable into rb hash

dog_breeds['message'].each do |breed, sub_breeds| #run through list.
  puts "* #{breed}"
  sub_breeds.each do |sub_breed| #check for available sub breed (print all)
    puts "  * #{sub_breed}" unless sub_breed.empty?
  end
end
