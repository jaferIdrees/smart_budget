require 'rails_helper'

describe 'User signs in', type: :system do
  before do
    @user = create :user
    visit new_user_session_path
  end

  scenario 'redirect to groups page after login' do
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'

    expect(page).to have_current_path groups_path
  end

  scenario 'redirect to new group page after click New group' do
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    click_link 'New group'

    expect(page).to have_current_path new_group_path
  end

  scenario 'crete new group after filling the name and clicking add' do
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    click_link 'New group'

    fill_in 'group_name', with: 'Test group'
    click_button 'Add'

    expect(page).to have_current_path groups_path
    expect(page).to have_text 'Test Group'
  end
end
