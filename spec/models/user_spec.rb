require 'rails_helper'

describe User do
  it { should have_many :comments}
  it "checks admin status" do
    user = FactoryGirl.create(:user)
    expect(user.admin).to eq false
  end
  it "changes admin status" do
    user = FactoryGirl.create(:user)
    user.admin = true
    expect(user.admin).to eq true
  end
end
