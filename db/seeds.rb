user1 = User.create!(email: "thumb@aol.com", password: "123456", first_name: "Tom", last_name: "Thumb", user_name: "Tommy", admin: true);

species1 = Species.create!(common_name: "American eel", scientific_name: "Anguilla rostrata", legal_size: "25", season_dates: "All Year", bag_limits: "25")

species2 = Species.create!(common_name: "Black Sea Bass", scientific_name: "Centropristis striata", legal_size: "15", season_dates: "May 18 - Sep 8", bag_limits: "5")

species3 = Species.create!(common_name: "Bluefish", scientific_name: "Pomatomus saltatrix", legal_size: "NA", bag_limits: "3", season_dates: "All Year")

species4 = Species.create!(common_name: "Cod (North of Cape)", scientific_name: "Gadus morhua", legal_size: "21", season_dates: "Sept 15 - Sept 30", bag_limits: "1")

species5 = Species.create!(common_name: "Cod (South of Cape)", scientific_name: "Gadus morhua", legal_size: "21", season_dates: "All Year", bag_limits: "10")

species6 = Species.create!(common_name: "Dab (plaice)", scientific_name: "Hippoglossoides platessoides", legal_size: "21", season_dates: "All Year", bag_limits: "No Limit")

species7 = Species.create!(common_name: "Fluke (summer flounder)", scientific_name: "Paralichthys dentatus", legal_size: "17", season_dates: "All Year", bag_limits: "5")

species8 = Species.create!(common_name: "Grey Sole (witch flounder)", scientific_name: "Glyptocephalus cynoglossus", legal_size: "14", season_dates: "All Year", bag_limits: "No Limit")

species9 = Species.create!(common_name: "Haddock (North of Cape Cod)", scientific_name: "Melanogrammus aeglefinus", legal_size: "17", season_dates: "Jan 1 - Feb 28, Apr 15 - Dec 31", bag_limits: "15")

species10 = Species.create!(common_name: "Haddock (South of Cape Cod)", scientific_name: "Melanogrammus aeglefinus", legal_size: "18", season_dates: "All Year", bag_limits: "No Limit")

species11 = Species.create!(common_name: "Halibut", scientific_name: "Hippoglossus hippoglossus", legal_size: "41", season_dates: "All Year", bag_limits: "1")

species12 = Species.create!(common_name: "Monkfish", scientific_name: "Lophius americanus", legal_size: "No Limit", season_dates: "All Year", bag_limits: "No Limit")

species13 = Species.create!(common_name: "Ocean Pout", scientific_name: "Zoarces americanus", legal_size: "None", season_dates: "Closed", bag_limits: "Prohibited")

species14 = Species.create!(common_name: "Pollock", scientific_name: "Pollachius virens", legal_size: "No Limit", season_dates: "All Year", bag_limits: "No Limit")

species15 = Species.create!(common_name: "Scup", scientific_name: "Stenotomus chrysops", legal_size: "9", season_dates: "All Year", bag_limits: "30 not to exceed 150 per vessel")

species16 = Species.create!(common_name: "Smelt", scientific_name: "Morone saxatilis", legal_size: "28", season_dates: "All Year", bag_limits: "1")

species17 = Species.create!(common_name: "Redfish", scientific_name: "Morone saxatilis", legal_size: "No Limit", season_dates: "All Year", bag_limits: "No Limit")

species18 = Species.create!(common_name: "River Herring", scientific_name: "Morone saxatilis", legal_size: "28", season_dates: "Closed", bag_limits: "Prohibited")

species19 = Species.create!(common_name: "Spiney Dogfish", scientific_name: "Morone saxatilis", legal_size: "No Limit", season_dates: "All Year", bag_limits: "No Limit")

species20 = Species.create!(common_name: "Striped Bass", scientific_name: "Morone saxatilis", legal_size: "28 - 35", season_dates: "All Year", bag_limits: "1")

species21 = Species.create!(common_name: "Tautog (blackfish)", scientific_name: "Morone saxatilis", legal_size: "16", season_dates: "Jan 1 - Mar 31, Apr 1 - May 31, Jun 1 - Jul 31, Aug 1 - Oct 14, Oct 15 - Dec 31", bag_limits: "3, 1, 3, 5")

species22 = Species.create!(common_name: "White Perch", scientific_name: "Morone saxatilis", legal_size: "28", season_dates: "All Year", bag_limits: "1")

species23 = Species.create!(common_name: "Windowpane", scientific_name: "Morone saxatilis", legal_size: "28", season_dates: "All Year", bag_limits: "1")

species24 = Species.create!(common_name: "Winter Flounder", scientific_name: "Morone saxatilis", legal_size: "28", season_dates: "All Year", bag_limits: "1")

species25 = Species.create!(common_name: "Wolffish", scientific_name: "Morone saxatilis", legal_size: "28", season_dates: "All Year", bag_limits: "1")

species26 = Species.create!(common_name: "Yellowtail Flounder", scientific_name: "Morone saxatilis", legal_size: "28", season_dates: "All Year", bag_limits: "1")

species27 = Species.create!(common_name: "Bonita", scientific_name: "Morone saxatilis", legal_size: "None", season_dates: "All Year", bag_limits: "No Limit")

species28 = Species.create!(common_name: "Striped Bass", scientific_name: "Morone saxatilis", legal_size: "28", season_dates: "All Year", bag_limits: "1")

species29 = Species.create!(common_name: "Striped Bass", scientific_name: "Morone saxatilis", legal_size: "28", season_dates: "All Year", bag_limits: "1")

species30 = Species.create!(common_name: "Striped Bass", scientific_name: "Morone saxatilis", legal_size: "28 - 35", season_dates: "All Year", bag_limits: "1")

record1 = Record.create!(name: "first record", success: "Good", user_id: User.first.id, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", latitude: 41.8, longitude: -70.8, date: Date.new(2020,8,20).to_s, time: Time.new(2020,8,20,9,45).to_s, datetime: Time.new(2020,8,20,9,45), js_date: Time.new(2020,8,20,9,45).to_f * 1000)
#user1 = User.create!(email: "thumb@aol.com", password: "123456", first_name: "Tom", last_name: "Thumb", user_name: "Tommy");

#record1 = Record.create!(name: "first record", success: "good", user_id: User.first.id, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", latitude: 41.8, longitude: -70.8, date: Date.new(2020,8,20).to_s, time: Time.new(2020,8,20,9,45).to_s, datetime: Time.new(2020,8,20,9,45), js_date: Time.new(2020,8,20,9,45).to_f * 1000)

#*** 
# NOTE: Run this code to change the success column from string to enum
# Code only needs to be done once
#***
# Record.all.each do |entry|
#   entry.success = %w(Good, Bad, Meh).index(entry.old_success)
#   entry.save!
# end
