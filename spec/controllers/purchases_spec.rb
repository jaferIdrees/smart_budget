require "rails_helper"

describe "Purchases page", type: :system do
  before do
    @user = create :user
    visit new_user_session_path

    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Log in"
  end

  

  scenario "Expect to redirect to purchases page when click group name" do
    click_link "New group"
    fill_in "group_name", with: 'Test group'
    click_button "Add"
    click_link 'Test group'

    expect(page).to have_text 'PURCHASES'
    expect(page).to have_link "New group"
  end

  
end