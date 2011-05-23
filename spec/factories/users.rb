Factory.sequence :full_name do |n|
  "test#{n}"
end

Factory.sequence :email do |n|
  "test#{n}@example.com"
end

Factory.define :user do |u|
  u.full_name { Factory.next(:full_name) }
  u.email { Factory.next(:email) } 
  u.password '123456'
end

Factory.define :confirmed_user, :parent => :user do |u|
  u.confirmed_at 1.hour.ago
end

Factory.define :user_registered_over_twitter, :parent => :user do |u|
  u.password ''
  u.confirmed_at 1.hour.ago
  u.identities {|a| [ a.association :twitter_identity ]}
end

Factory.define :not_confirmed_user, :parent => :user do |u|
  u.confirmed_at nil
end


