FactoryGirl.define do
  factory :album do
    sequence(:title) { |n| "Purple album#{n}" }
    sequence(:artist) { |n| "PrinceMon#{n}" }

  end
end
