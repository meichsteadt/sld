require 'rails_helper'

describe 'goes through the product add process' do
  it 'shows all proudcts' do
    product = FactoryGirl.create(:product)
    visit products_path
    visit product_path(product)
    expect(page).to have_content 'Super dope table'
  end
  it 'adds a new product' do
    user = FactoryGirl.create(:user)
    user.update(admin: true)
    login_as(user, scope: :user)
    visit root_path
    click_link 'Add product'
    fill_in 'product[name]', :with => 'test'
    fill_in 'product[description]', :with => 'another test'
    fill_in 'product[price]', :with => '1'
    fill_in 'product[photo]', :with => 'a'
    click_button 'Update Product'
    expect(page).to have_content 'Successfully created product'
  end
  it 'fails to add a product' do
    user = FactoryGirl.create(:user)
    user.update(admin: true)
    login_as(user, scope: :user)
    visit new_product_path
    click_button 'Update Product'
    expect(page).to have_content "Name can't be blank"
  end
  it "edits a product" do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product)
    user.update(admin: true)
    login_as(user, scope: :user)
    visit edit_product_path(product)
    fill_in 'product[name]', :with => 'less dope table'
    click_button 'Update Product'
    expect(page).to have_content "less dope table"
  end
  it "fails to edit a product" do
    product = FactoryGirl.create(:product)
    visit edit_product_path(product)
    fill_in 'product[name]', :with => ''
    click_button 'Update Product'
    expect(page).to have_content "Name can't be blank"
  end
  it "destroys a product" do
    user = FactoryGirl.create(:user)
    user.update(admin: true)
    login_as(user, scope: :user)
    product = FactoryGirl.create(:product)
    visit product_path(product)
    click_link '| Delete product'
    expect(page).to have_content 'Product deleted'
  end
end
