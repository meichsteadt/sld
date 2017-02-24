require 'rails_helper'

describe 'goes through the product add process' do
  it 'adds a proudct comment' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    product = FactoryGirl.create(:product)
    visit product_path(product)
    click_link 'Leave Comment'
    fill_in 'comment[comment]', :with => 'dope table breh'
    click_button 'Upload'
    expect(page).to have_content 'dope table breh'
  end
  it 'fails to add a product comment' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    product = FactoryGirl.create(:product)
    visit new_product_comment_path(product)
    click_button 'Upload'
    expect(page).to have_content 'Comments is invalid'
  end
  it 'fails to add a product comment' do
    user = FactoryGirl.create(:user)
    user.update(admin: true)
    login_as(user, scope: :user)
    product = FactoryGirl.create(:product)
    comment = FactoryGirl.build(:comment)
    product.comments.push(comment)
    product.save
    visit product_path(product)
    click_link 'Delete comment'
    expect(page).to have_content 'Sofa'
  end
end
