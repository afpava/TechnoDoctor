require 'rails_helper'

RSpec.describe Model, type: :model do
  describe "when Model.new is called" do
  let(:category) { Category.create(description:"test") }
  let(:brand) { Brand.create(description:"test", category_id: category.id )}
  let(:brand3) { Brand.create(description:"test3", category_id: category.id )}
  let(:brand2) { Brand.create(description:"test2", category_id: category.id )}

  it "validation description shouldn't be blank" do
    model = Model.create(description:"", brand_id: brand.id)
    expect(model.errors.messages[:description]).to include("can't be blank")
  end

  it "validation description should be unique in category" do
    model = Model.create(description:"test", brand_id: brand.id)
    model1 = Model.create(description:"test", brand_id: brand.id)
    model2 = Model.create(description:"test", brand_id: brand3.id)
    expect(model).to be_valid
    expect(model1.errors.messages[:description]).to include("Model exists!")
    expect(model2).to be_valid
  end


  end #Validations

end
