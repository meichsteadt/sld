require 'rails_helper'

describe Product do
  it { should have_many :comments}
end
