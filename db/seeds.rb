user1 = User.create!(email: "thumb@aol.com", password: "123456", first_name: "Tom", last_name: "Thumb", user_name: "Tommy");

#record1 = Record.create!(name: "first record", success: "Good", user_id: User.first.id, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", latitude: 41.8, longitude: -70.8, date: Date.new(2020,8,20).to_s, time: Time.new(2020,8,20,9,45).to_s, datetime: Time.new(2020,8,20,9,45), js_date: Time.new(2020,8,20,9,45).to_f * 1000)
