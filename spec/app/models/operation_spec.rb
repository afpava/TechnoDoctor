require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe "when Operation.new is called" do
  let(:category) {Category.create(description:"test")}
  let(:category2) {Category.create(description:"test2")}

  it "validation description shouldn't be blank" do
    operation = Operation.create(description:"", category_id: category.id, price: 123 )
    expect(operation.errors.messages[:description]).to include("can't be blank")
  end

  it "validation price shouldn't be blank" do
    operation = Operation.create(description:"test", category_id: category.id, price: nil )
    expect(operation.errors.messages[:price]).to include("can't be blank")
  end

  it "validation price should be number" do
    operation = Operation.create(description:"test", category_id: category.id, price: nil )
    expect(operation.errors.messages[:price]).to include("can't be blank")
  end

  it "validation description should be unique in category" do
    operation = Operation.create(description:"test", category_id: category.id, price: 123)
    operation1 = Operation.create(description:"test", category_id: category.id, price: 123)
    operation2 = Operation.create(description:"test", category_id: category2.id, price: 123)
    expect(operation).to be_valid
    expect(operation1.errors.messages[:description]).to include("Operation exists!")
    expect(operation2).to be_valid
  end

  it "applies a default scope to collections by category" do
   expect(Operation.by_category(1).to_sql).to eq Operation.where(category: 1).to_sql
 end



  end #Validations

end
