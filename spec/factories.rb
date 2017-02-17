FactoryGirl.define do
  factory(:user) do
    email 'test1234@test.com'
    password 'password'
    admin false
  end

  factory(:comment) do
    comment 'test'
    rating 5
  end
end
