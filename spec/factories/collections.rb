# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collection do
    user_id { User.first.try(:id) || FactoryGirl.create(:user).id }
    name 'Моя новая коллекция'
    share false
    factory :share_collection do
      share true
    end
  end
end
