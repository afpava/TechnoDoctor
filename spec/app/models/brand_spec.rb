require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe "when Brand.new is called" do
  let(:category) {Category.create(description:"test")}
  let(:category2) {Category.create(description:"test2")}
  it "validation description shouldn't be blank" do
    brand = Brand.create(description:"", category_id: category.id)
    expect(brand.errors.messages[:description]).to include("can't be blank")
  end

  it "validation description should be unique in category" do
    brand = Brand.create(description:"test", category_id: category.id)
    brand1 = Brand.create(description:"test", category_id: category.id)
    brand2 = Brand.create(description:"test", category_id: category2.id)
    expect(brand).to be_valid
    expect(brand1.errors.messages[:description]).to include("Brand exists!")
    expect(brand2).to be_valid
  end


  end #Validations

end
