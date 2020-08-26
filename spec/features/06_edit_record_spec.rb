
require 'rails_helper'

feature 'user edits a record', %Q{ As a signed in user I want to be able to edit an existing record } do
  scenario 'edit an entry' do

    visit new_record_path
    
    fill_in 'Name', with: "name"
    fill_in 'Description', with: "body"
    fill_in 'Latitude', with: 41.8
    fill_in 'Longitude', with: -70.8

    select 'Good', from: 'record_success'
    select "2020", :from => 'record_datetime_1i'
    select "August", :from => 'record_datetime_2i'
    select "20", :from => 'record_datetime_3i'
    select "11", :from => 'record_datetime_4i'
    select "22", :from => 'record_datetime_5i'
    
    click_button 'Submit'

    visit edit_record_path(params[:id])

    expect(page).to have_content('Edit Entry')
    expect(page).to have_content(record.body)
    expect(page).to have_content(record.name)  

    fill_in 'Name', with: "changed_name"
    fill_in 'Description', with: "changed_body"
    select 'Bad', from: 'record_success'

    click_button 'Submit'

    expect(page).to have_content('Air Temperature')
    expect(page).to have_content(record.name)
    expect(page).to have_content(record.body)
    expect(page).to have_content(record.latitude)
    expect(page).to have_content(record.longitude)
    expect(page).to have_content(record.body)
  end
end