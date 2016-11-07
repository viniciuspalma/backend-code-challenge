FactoryGirl.define do
  factory :point do
    latitude { rand(-90.0..90.0) }
    longitude { rand(-180.0..180.0) }
    timestamp { Time.now.to_i }
    current_heading { rand(0..359) }
    vehicle
    city
  end
end
