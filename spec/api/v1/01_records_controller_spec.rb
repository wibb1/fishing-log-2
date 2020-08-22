require 'rails_helper'

RSpec.describe Api::V1::RecordsController, type: :controller do
  describe "#GET#Index" do
    let!(:user1) {FactoryBot.create(:user)}
    let!(:record1) {FactoryBot.create(:record, user: user1)}
    let!(:user2) {FactoryBot.create(:user)}
    let!(:record2) {FactoryBot.create(:record, user: user2)}

    it "returns a status of 200 - records_controller - line 42" do
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
    let!(:user1) {FactoryBot.create(:user)}
    let!(:record1) {FactoryBot.create(:record, user: user1)}
    let!(:user2) {FactoryBot.create(:user)}
    let!(:record2) {FactoryBot.create(:record, user: user2)}

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