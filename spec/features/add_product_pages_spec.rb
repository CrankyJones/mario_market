require 'rails_helper'

describe "the add a product process" do

  before :each do
    # admin
    User.create(
      username: 'adminUser',
      email: 'admin@test.com',
      password: '123456',
      password_confirmation: '123456',
      admin: true
    )
    visit '/users/sign_in'
    fill_in 'email', with: 'admin@test.com'
    fill_in 'password', with: '12345678'
    click_on 'Log in'
  end


  it "adds a new product" do
    visit products_path
    click_on 'Add a new product'
    fill_in 'Product Name', :with => 'spicy beans'
    fill_in 'Product Price', :with => '3.50'
    fill_in 'Product Origin', :with => 'Brazil'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Spicy Beans'
  end

  it "remains on the page when a field is empty" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).not_to have_content 'Product successfully added!'
  end
end

describe "the edit a product process" do

  before :each do
    # admin
    User.create(
      username: 'adminUser',
      email: 'admin@test.com',
      password: '123456',
      password_confirmation: '123456',
      admin: true
    )
    visit '/users/sign_in'
    fill_in 'email', with: 'admin@test.com'
    fill_in 'password', with: '12345678'
    click_on 'Log in'
  end

  it "edits a product" do
    visit products_path
    click_button 'Add a new product'
    fill_in 'Product Name', :with => 'spicy beans'
    fill_in 'Product Price', :with => '3.50'
    fill_in 'Product Origin', :with => 'Brazil'
    click_button 'Create Product'
    click_on 'Spicy Beans'
    click_button 'Edit or delete product'
    fill_in 'Product Price', :with => '2.75'
    click_button 'Update Product'
    expect(page).to have_content "Product successfully updated!"
  end

  it "remains on the page when a field is empty" do
    visit products_path
    click_button 'Add a new product'
    fill_in 'Product Name', :with => 'spicy beans'
    fill_in 'Product Price', :with => '3.50'
    fill_in 'Product Origin', :with => 'Brazil'
    click_button 'Create Product'
    click_on 'Spicy Beans'
    click_button 'Edit or delete product'
    fill_in 'Product Name', :with => ''
    fill_in 'Product Price', :with => ''
    fill_in 'Product Origin', :with => ''
    click_button 'Update Product'
    expect(page).not_to have_content "Product successfully updated!"
  end


  describe "the delete product process" do
    it "deletes a product" do
      visit root_path
      click_link 'Head to our product catalogue.'
      click_button 'Add a new product'
      fill_in 'Product Name', :with => 'spicy beans'
      fill_in 'Product Price', :with => '3.50'
      fill_in 'Product Origin', :with => 'Brazil'
      click_button 'Create Product'
      click_on 'Spicy Beans'
      click_button 'Edit or delete product'
      click_link 'Delete Product'
      expect(page).not_to have_content "Spicy Beans"
    end
  end
end