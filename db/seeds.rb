#user1 = User.create!(email: "thumb@aol.com", password: "123456", first_name: "Tom", last_name: "Thumb", user_name: "Tommy", admin: true);

species1 = Species.create!(common_name: "American eel", scientific_name: "Anguilla rostrata", shallow_depth: "0", deep_depth: "40")

species2 = Species.create!(common_name: "Black Sea Bass", scientific_name: "Centropristis striata", shallow_depth: "0", deep_depth: "100")

species3 = Species.create!(common_name: "Bluefish", scientific_name: "Pomatomus saltatrix", shallow_depth: "0", deep_depth: "100")

species4 = Species.create!(common_name: "Cod", scientific_name: "Gadus morhua", shallow_depth: "0", deep_depth: "2000",)

species5 = Species.create!(common_name: "Dab (plaice)", scientific_name: "Hippoglossoides platessoides", shallow_depth: "120", deep_depth: "600")

species6 = Species.create!(common_name: "Grey Sole (witch flounder)", scientific_name: "Glyptocephalus cynoglossus", shallow_depth: "360", deep_depth: "4400")

species7 = Species.create!(common_name: "Fluke (summer flounder)", scientific_name: "Paralichthys dentatus", shallow_depth: "0", deep_depth: "500")

species8 = Species.create!(common_name: "Halibut", scientific_name: "Hippoglossus hippoglossus", shallow_depth: "650", deep_depth: "1700")

species9 = Species.create!(common_name: "Haddock", scientific_name: "Melanogrammus aeglefinus", shallow_depth: "100", deep_depth: "500")

species10 = Species.create!(common_name: "Cusk", scientific_name: "Brosme brosme", shallow_depth: "60", deep_depth: "90")

species11 = Species.create!(common_name: "Striped Bass", scientific_name: "Morone saxatilis", shallow_depth: "0", deep_depth: "0")

species12 = Species.create!(common_name: "Monkfish", scientific_name: "Lophius americanus", shallow_depth: "0", deep_depth: "3000")

species13 = Species.create!(common_name: "Ocean Pout", scientific_name: "Zoarces americanus", shallow_depth: "30", deep_depth: "630")

species14 = Species.create!(common_name: "Pollock", scientific_name: "Pollachius virens", shallow_depth: "115", deep_depth: "0")

species15 = Species.create!(common_name: "Scup", scientific_name: "Stenotomus chrysops", shallow_depth: "330", deep_depth: "410")

species17 = Species.create!(common_name: "Redfish", scientific_name: "Lesiostomus xanthurus", shallow_depth: "0", deep_depth: "30")

species19 = Species.create!(common_name: "Spiney Dogfish", scientific_name: "Squalus acanthias", shallow_depth: "0", deep_depth: "2000")

species20 = Species.create!(common_name: "False Albacore", scientific_name: "Euthynnus alletteratus", shallow_depth: "0", deep_depth: "300")

species21 = Species.create!(common_name: "Tautog (blackfish)", scientific_name: "Tautoga onitis", shallow_depth: "0", deep_depth: "250")

species23 = Species.create!(common_name: "Windowpane", scientific_name: "Scophthalmus aquosus", shallow_depth: "0", deep_depth: "250")

species24 = Species.create!(common_name: "Winter Flounder", scientific_name: "Pseudopleuronectes americanus", shallow_depth: "0", deep_depth: "240")

species25 = Species.create!(common_name: "Wolffish", scientific_name: "Anarhichas lupus", shallow_depth: "70", deep_depth: "1640")

species26 = Species.create!(common_name: "Yellowtail Flounder", scientific_name: "Pleuronectes ferruginea", shallow_depth: "0", deep_depth: "0")

species27 = Species.create!(common_name: "Bonito", scientific_name: "Sarda sarda", shallow_depth: "0", deep_depth: "300")

#user2 = User.create!(email: "me@aol.com", password: "123456", first_name: "me", last_name: "you", user_name: "them", admin: false);

#record1 = Record.create!(name: "first record", success: "good", user_id: User.first.id, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", latitude: 41.8, longitude: -70.8, date: Date.new(2020,8,20).to_s, time: Time.new(2020,8,20,9,45).to_s, datetime: Time.new(2020,8,20,9,45), js_date: Time.new(2020,8,20,9,45).to_f * 1000, species_id: species11.id)

#record2 = Record.create!(name: "first record", success: "good", user_id: User.first.id, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", latitude: 41.8, longitude: -70.8, date: Date.new(2020,8,20).to_s, time: Time.new(2020,8,20,9,45).to_s, datetime: Time.new(2020,8,20,9,45), js_date: Time.new(2020,8,20,9,45).to_f * 1000, species_id: species3.id)
