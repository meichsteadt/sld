FactoryGirl.define do
  factory(:user) do
    email 'test1234@test.com'
    password 'password'
    admin false
  end

  factory(:product) do
    name 'Super dope table'
    description 'see the name'
    price 12
    photo 'a'
  end

  factory(:comment) do
    comment 'test'
    rating 5
  end
end
