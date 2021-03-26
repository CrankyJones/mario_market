require 'rails_helper'

context "authentication roles through user tiers" do

  before :each do
    # normal user
    User.create(
      username: 'User',
      email: 'user@test.com',
      password: '123456',
      password_confirmation: '123456'
    )
    # admin
    User.create(
      username: 'adminUser',
      email: 'admin@test.com',
      password: '123456',
      password_confirmation: '123456',
      admin: true
    )
  end

  scenario "an authorized user set to admin should be able to view secured pages" do

    visit '/users/sign_in'
    fill_in 'user_email', with: 'admin@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'
    visit '/admin'

    expect(page).to have_content 'Site Administration'

  end

  scenario "an unauthorized user chould not have access" do

    visit '/users/sign_in'
    fill_in 'user_email', with: 'user@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'
    visit '/admin'

    expect(page).to have_no_content 'Site Administration'

  end

end