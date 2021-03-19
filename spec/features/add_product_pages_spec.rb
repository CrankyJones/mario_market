require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit root_path
    click_link 'Head to our product catalogue.'
    click_link 'Add a new product'
    fill_in 'Product Name', :with => 'spicy beans'
    fill_in 'Product Price', :with => '3.50'
    fill_in 'Product Origin', :with => 'Brazil'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Spicy Beans'
  end
end