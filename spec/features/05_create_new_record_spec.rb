require 'rails_helper'

feature 'user does not sign in and attempts to create a new record', %Q{ A user that is not signed in cannot create a new record } do
  scenario 'create an invalid entry' do
  user = FactoryBot.create(:user)

  visit new_record_path
  click_button 'Submit'
  expect(page).to have_content('User must exist')
  end
end

feature 'user that is signed in must complete all the required form fields before being allowed to submit the new record' do
  scenario 'create an invalid entry' do
    visit new_record_path
    click_button 'Submit'

    expect(page).to have_content('New Record')
  end
end

feature 'user creates a new record', %Q{ As a signed in user I want to be able to create a new record } do
    scenario 'create a valid entry' do

    visit new_record_path
    
    page.fill_in 'Name', with: "name"
    page.fill_in 'Description', with: "body"
    page.fill_in 'Latitude', with: 41.8
    page.fill_in 'Longitude', with: -70.8
    page.select 'Good', from: 'record_success'
    page.select "2020", from: 'record_datetime_1i'
    page.select "August", from: 'record_datetime_2i'
    page.select "20", from: 'record_datetime_3i'
    page.select "11", from: 'record_datetime_4i'
    page.select "22", from: 'record_datetime_5i'
    save_and_open_page
    binding.pry
    click_button 'Submit'

    expect(page).to have_content('Air Temperature')
    expect(page).to have_content(record.name)
    expect(page).to have_content(record.body)
    expect(page).to have_content(record.latitude)
    expect(page).to have_content(record.longitude)
    expect(page).to have_content(record.date)
    expect(page).to have_content(record.body)

  end
end