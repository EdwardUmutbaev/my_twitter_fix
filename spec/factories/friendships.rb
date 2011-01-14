# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :friendship do |f|
  f.follower_id 1
  f.followed_id 1
end
