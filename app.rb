require 'bundler'
require 'json'
require 'csv'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'scrapper'
require "google_drive"

# myObj = Scrapping.new.get_all_the_urls_of_val_doise_townhalls
# File.open("db/emails.JSON","w") do |f|
# 	f.write(myObj.to_json)
# end


# session = GoogleDrive::Session.from_config("config.json")
#  ws = session.spreadsheet_by_key("1BUA2GcKc4aacuYE6kBMEriW408LJACR2aLD7MAV2u3c").worksheets[0]
	json = File.read('db/emails.JSON')
	data = JSON.parse(json)
	compteur = 1
 	# data.each do |x,y|
 	# 	ws[compteur, 1] = x
 	# 	ws[compteur, 2] = y
 	# 	compteur += 1
 	# end
 	# ws.save

 	CSV.open("db/mairie.csv", "wb") do |csv|
 		data.each do |key,value|
  			csv << [key,value]
  		end
	end