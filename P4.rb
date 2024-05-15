#Tran Minh Tu

require 'net/http'
require 'json'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
tree_data = JSON.parse(response)

ash_tree_count = 0

tree_data.each do |tree|
  #&. safe navigation operator (doesn't output error for nil[empty value] )
  # checks if the lowercase/uppercase/mixed-case version of ash is in
  if tree['common_name']&.downcase.include?('ash')
    ash_tree_count += 1
  end
end

puts "Number of Ash trees: #{ash_tree_count}"
