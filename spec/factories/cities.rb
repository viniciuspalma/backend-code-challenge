FactoryGirl.define do
  factory :city do
    sequence(:name) { |i| "City #{i}" }
    center_latitude { rand(-90.0..90.0) }
    center_longitude { rand(-180.0..180.0) }
    city_delimiter { rand(1.0..200.0) }
  end
end
