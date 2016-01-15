FactoryGirl.define do
  factory :tweet do
    zombie do
      FactoryGirl.create :zombie
    end
    sequence(:status) { "status NO#{Random.rand(3)}" }
  end
end