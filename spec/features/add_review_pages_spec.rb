require 'rails_helper'

describe "the add a review process" do

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
  
  it "adds a new review" do
    visit '/users/sign_in'
    fill_in 'user_email', with: 'admin@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'

    visit '/products'
    click_button 'Add a new product'
    fill_in 'Product Name', :with => 'spicy beans'
    fill_in 'Product Price', :with => '3.50'
    fill_in 'Product Origin', :with => 'Brazil'
    click_button 'Create Product'
    click_on 'Spicy Beans'
    click_button 'Add a review for this product'
    fill_in 'Enter a title for your review:', :with => 'Great Product'
    fill_in 'Enter your review (Must be between 50 & 250 characters):', :with => 'this is a lot of characterssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss'
    fill_in 'Enter a rating for the product (1 to 5, 5 being the highest):', :with => '1'
    click_button 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Great Product'
  end

  it "add a new review fail" do
    visit '/users/sign_in'
    fill_in 'user_email', with: 'admin@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'

    visit '/products'
    click_button 'Add a new product'
    fill_in 'Product Name', :with => 'spicy beans'
    fill_in 'Product Price', :with => '3.50'
    fill_in 'Product Origin', :with => 'Brazil'
    click_button 'Create Product'
    click_on 'Spicy Beans'
    click_button 'Add a review for this product'
    click_button 'Create Review'
    expect(page).not_to have_content 'Review successfully added!'
  end
end

describe "the edit a review process" do

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

  it "edits a review" do
    visit '/users/sign_in'
    fill_in 'user_email', with: 'admin@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'

    visit '/products'
    click_on 'Add a new product'
    fill_in 'Product Name', :with => 'spicy beans'
    fill_in 'Product Price', :with => '3.50'
    fill_in 'Product Origin', :with => 'Brazil'
    click_button 'Create Product'
    click_on 'Spicy Beans'

    click_on 'Add a review for this product'
    fill_in 'Enter a title for your review:', :with => 'Great Product'
    fill_in 'Enter your review (Must be between 50 & 250 characters):', :with => 'this is a lot of characterssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss'
    fill_in 'Enter a rating for the product (1 to 5, 5 being the highest):', :with => '1'
    click_button 'Create Review'
    click_on 'Great Product'
    click_button 'Edit or Delete Review'
    fill_in 'Enter a title for your review:', :with => 'Bad Product'
    click_button 'Update Review'

    expect(page).to have_content "Review successfully updated!"
  end
  it "edits a review fail" do
    visit '/users/sign_in'
    fill_in 'user_email', with: 'admin@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'

    visit '/products'
    click_button 'Add a new product'
    fill_in 'Product Name', :with => 'spicy beans'
    fill_in 'Product Price', :with => '3.50'
    fill_in 'Product Origin', :with => 'Brazil'
    click_button 'Create Product'
    click_on 'Spicy Beans'

    click_button 'Add a review for this product'
    fill_in 'Enter a title for your review:', :with => 'Great Product'
    fill_in 'Enter your review (Must be between 50 & 250 characters):', :with => 'this is a lot of characterssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss'
    fill_in 'Enter a rating for the product (1 to 5, 5 being the highest):', :with => '1'
    
    click_button 'Create Review'
    click_on 'Great Product'
    click_button 'Edit or Delete Review'
    fill_in 'Enter a title for your review:', :with => ''
    fill_in 'Enter your review (Must be between 50 & 250 characters):', :with => ''
    fill_in 'Enter a rating for the product (1 to 5, 5 being the highest):', :with => ''
    click_button 'Update Review'

    expect(page).not_to have_content "Review successfully updated!"
  end
end

  describe "the delete a review process" do

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

    it "deletes a review" do
      visit '/users/sign_in'
      fill_in 'user_email', with: 'admin@test.com'
      fill_in 'user_password', with: '123456'
      click_on 'Log in'
  
      visit '/products'
      click_button 'Add a new product'
      fill_in 'Product Name', :with => 'spicy beans'
      fill_in 'Product Price', :with => '3.50'
      fill_in 'Product Origin', :with => 'Brazil'
      click_button 'Create Product'
      click_on 'Spicy Beans'
      click_button 'Add a review for this product'
      fill_in 'Enter a title for your review:', :with => 'Great Product'
      fill_in 'Enter your review (Must be between 50 & 250 characters):', :with => 'this is a lot of characterssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss'
      fill_in 'Enter a rating for the product (1 to 5, 5 being the highest):', :with => '1'
      click_button 'Create Review'
      click_on 'Great Product'
      click_button 'Edit or Delete Review'
      click_link 'Delete Review'
      expect(page).not_to have_content "Great Product"
    end
  end
