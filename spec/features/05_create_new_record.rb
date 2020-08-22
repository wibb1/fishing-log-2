require 'rails_helper'

feature 'user does not sign in and attempts to create a new record', %Q{ A user that is not signed in cannot create a new record } do
  scenario 'create an invalid entry' do
  user = FactoryBot.create(:user)

  visit new_record_path

  end
end

feature 'user that is signed in must complete all the required form fields before being allowed to submit the new record'
  scenario 'create an invalid entry' do
    visit new_record_path
    click_button 'Submit'

    expect(page).to have_content('Please fill out this field.')
  end
end

feature 'user signs creates a new record', %Q{ As a signed in user I want to be able to create a new record } do
    scenario 'create an invalid entry' do

    visit new_record_path
    
    fill_in 'Name', with: "name"
    fill_in 'Description', with: "body"
    fill_in 'Latitude', with: 41.8
    fill_in 'Longitude', with: -70.8

    select 'Good', from: 'success'
    select "2020", :from => 'datetime(1i)'
    select "August", :from => 'datetime(2i)'
    select "20", :from => 'datetime(3i)'
    select "11", :from => 'datetime(4i)'
    select "22", :from => 'datetime(5i)'
    
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