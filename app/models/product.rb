class Product < ActiveRecord::Base
  has_many :comments, as: :commentable
  validates :name, :price, :description, :photo, :presence => true
end
