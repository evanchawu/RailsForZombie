FactoryGirl.define do
  factory :brain do
    zombie do
      FactoryGirl.create :zombie
    end
    sequence(:status) { "status NO#{Random.rand(3)}" }
    sequence(:flavor) { "flavor NO#{Random.rand(10)}" }
  end
end