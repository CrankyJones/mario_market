require 'rails_helper'

describe "the add a review process" do
  it "adds a new product" do
    visit root_path
    click_link 'Head to our product catalogue.'
    click_link 'Add a new product'
    fill_in 'Product Name', :with => 'spicy beans'
    fill_in 'Product Price', :with => '3.50'
    fill_in 'Product Origin', :with => 'Brazil'
    click_on 'Create Product'
    click_on 'Spicy Beans'
    click_on 'Add a review for this product'
    fill_in 'Enter your name:', :with => 'Sally Robinson'
    fill_in 'Enter a title for your review:', :with => 'Great Product'
    fill_in 'Enter your review (Must be between 50 & 250 characters):', :with => 'this is a lot of characterssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss'
    fill_in 'Enter a rating for the product (1 to 5, 5 being the highest):', :with => '1'
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Great Product'
  end
end

describe "the edit a review process" do
  it "edits a product" do
    visit root_path
    click_link 'Head to our product catalogue.'
    click_link 'Add a new product'
    fill_in 'Product Name', :with => 'spicy beans'
    fill_in 'Product Price', :with => '3.50'
    fill_in 'Product Origin', :with => 'Brazil'
    click_on 'Create Product'
    click_on 'Spicy Beans'
    click_on 'Add a review for this product'
    fill_in 'Enter your name:', :with => 'Sally Robinson'
    fill_in 'Enter a title for your review:', :with => 'Great Product'
    fill_in 'Enter your review (Must be between 50 & 250 characters):', :with => 'this is a lot of characterssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss'
    fill_in 'Enter a rating for the product (1 to 5, 5 being the highest):', :with => '1'
    click_on 'Create Review'
    click_on 'Great Product'
    click_on 'Edit or Delete Review'
    fill_in 'Enter a title for your review:', :with => 'Bad Product'
    click_on 'Update Review'
    expect(page).to have_content "Review successfully updated!"
  end
end

  describe "the delete a review process" do
    it "deletes a review" do
      visit root_path
      click_link 'Head to our product catalogue.'
      click_link 'Add a new product'
      fill_in 'Product Name', :with => 'spicy beans'
      fill_in 'Product Price', :with => '3.50'
      fill_in 'Product Origin', :with => 'Brazil'
      click_on 'Create Product'
      click_on 'Spicy Beans'
      click_on 'Add a review for this product'
      fill_in 'Enter your name:', :with => 'Sally Robinson'
      fill_in 'Enter a title for your review:', :with => 'Great Product'
      fill_in 'Enter your review (Must be between 50 & 250 characters):', :with => 'this is a lot of characterssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss'
      fill_in 'Enter a rating for the product (1 to 5, 5 being the highest):', :with => '1'
      click_on 'Create Review'
      click_on 'Great Product'
      click_on 'Edit or Delete Review'
      click_on 'Delete Review'
      expect(page).not_to have_content "Great Product"
    end
  end
