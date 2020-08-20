user1 = User.create!(email: "thumb@aol.com", password: "123456", first_name: "Tom", last_name: "Thumb", user_name: "Tommy");

record1 = Record.create!(name: "first record", success: "Good", user_id: User.first.id)
