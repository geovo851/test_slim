FactoryGirl.define do
  factory :category do
    title 'Men\'s Outerwear'
  end

  factory :product do 
    name 'Double Breasted Pocket Hemming'
    price 75
    category
  end
end
