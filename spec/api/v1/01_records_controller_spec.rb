require 'rails_helper'

RSpec.describe Api::V1::RecordsController, type: :controller do
  describe "#GET#Index" do
    let!(:user1) {User.create(email: "thumb@aol.com", password: "123456", user_name: "Tommy", first_name: "Tom", last_name: "Thumb")}
    let!(:record1) {Record.create(name: "User 1 First Record", success: "good", user_id: user1.id, latitude: 41.8, longitude: -70.6, date: Date.new(2020,4,20).to_s, time: "09:45", datetime: Time.new(2020,8,20,9,45))}
    let!(:user2) {User.create(email: "apple@aol.com", user_name: "user2", password: "123456", first_name: "John", last_name: "Apple")}
    let!(:record2) {Record.create(name: "User 2 First Record", success: "good", user_id: user2.id, latitude: 41.8, longitude: -70.6, date: Date.new(2020,4,20).to_s, time: "09:45", datetime: Time.new(2020,8,20,9,45))}

    it "returns a status of 200 - trips_controller_spec - line 42" do
      sign_in user1
      get :index
      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
      sign_out user1
    end

    it "returns user1 records in the database" do
      sign_in user1
      get :index
      returned_json = JSON.parse(response.body)

      expect(returned_json["records"]["records"][0]["name"]).to eq(record1.name)
      expect(returned_json["records"]["records"][0]["success"]).to eq(record1.success)
      expect(returned_json["records"]["records"][0]["user_id"]).to eq(user1.id)
      
      sign_out user1
    end
  end
end

RSpec.describe Api::V1::RecordsController, type: :controller do
  describe "#GET#Show" do

    let!(:user1) {User.create(email: "thumb@aol.com", password: "123456", user_name: "Tommy", first_name: "Tom", last_name: "Thumb")}

    let!(:record1) {Record.create(name: "User 1 First Record", success: "Good", user_id: user1.id)}

    let!(:user2) {User.create(email: "apple@aol.com", user_name: "user2", password: "123456", first_name: "John", last_name: "Apple")}

    let!(:record2) {Record.create(name: "User 2 First Record", success: "Good", user_id: user2.id)}

    let!(:user1) {User.create(email: "thumb@aol.com", password: "123456", user_name: "Tommy", first_name: "Tom", last_name: "Thumb")}

    let!(:record1) {Record.create(name: "User 1 First Record", success: "Good", user_id: user1.id)}

    let!(:user2) {User.create(email: "apple@aol.com", user_name: "user2", password: "123456", first_name: "John", last_name: "Apple")}

    let!(:record2) {Record.create(name: "User 2 First Record", success: "Good", user_id: user2.id)}

    it "returns a status of 200 - records_controller_spec" do
          
      sign_in user1
      
      get :show, params: { id: record1.id }
      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"

      sign_out user1
    end

    it "returns user1 records in the database" do
      sign_in user1
      get :show, params: { id: record1.id }
   
      returned_json = JSON.parse(response.body)

      expect(returned_json["record"]["name"]).to eq(record1.name)
      expect(returned_json["record"]["success"]).to eq(record1.success)
      expect(returned_json["record"]["user_id"]).to eq(user1.id)
      
      sign_out user1
    end
  end
end