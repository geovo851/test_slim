require 'rails_helper'

describe Product do

  let(:category) { FactoryGirl.create(:category) }
  before { @product = category.products.build(name: "Lorem ipsum", price: 15) }

  subject { @product }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:price) }

  context "when category_id is not present" do
    before { @product.category_id = nil }
    it { is_expected.to_not be_valid }
  end

  context "with price 0" do
    before { @product.price = 0 }
    it { is_expected.to_not be_valid }
  end

end
