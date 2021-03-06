# require 'rails_helper'

# feature 'user does not sign in and attempts to create a new record', %Q{ A user that is not signed in cannot create a new record } do
#   scenario 'create an invalid entry'do
  
#   visit new_record_path
  
#   click_button 'Submit'
  
#   expect(page).to have_content('New Record')
#   end
# end

# feature 'user that is signed in must complete all the required form fields before being allowed to submit the new record', %Q{ A user must complete the required forms to create a new record } do

#   scenario 'create an invalid entry' do
#     user = FactoryBot.create(:user)

#     visit new_user_session_path

#     fill_in 'Email', with: user.email
#     fill_in 'Password', with: user.password

#     click_button 'Sign in'

#     visit new_record_path

#     click_button 'Submit'

#     expect(page).to have_content('New Record')
#   end
# end

# feature 'user creates a new record', %Q{ As a signed in user I want to be able to create a new record } do
#     scenario 'create a valid entry' do

#     user = FactoryBot.create(:user)

#     visit new_user_session_path

#     fill_in 'Email', with: user.email
#     fill_in 'Password', with: user.password

#     click_button 'Sign in'

#     visit new_record_path
    
#     fill_in 'record_name', with: 'name'
#     fill_in 'record_body', with: 'body'
#     fill_in 'record_latitude', with: '41.8'
#     fill_in 'record_longitude', with: '-70.8'
#     select 'Good', from: 'record_success'
    
#     select "16", from: 'record_datetime_3i'
#     select "August", from: 'record_datetime_2i'
#     select "2020", from: 'record_datetime_1i'
#     select "11", from: 'record_datetime_4i'
#     select "22", from: 'record_datetime_5i'

#     click_button 'Submit'
#     save_and_open_page
#     #expect { click_button "Submit" }.to replace_page
#     expect(page).to have_content('Record successfully saved')

#   end
#end