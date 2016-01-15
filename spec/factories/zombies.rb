FactoryGirl.define do
  factory :zombie do
    sequence(:name) { 
    	name_length = Random.rand(10)
    	range = [*'A'..'Z']
    	(0..name_length).map{ range.sample }.join
    }
    sequence(:bio) { |n| "from #{n} area" }
    sequence(:age) { Random.rand(100) }
    rotting [true, false].sample
    email "ooxx@gmail.com"
  end
end



