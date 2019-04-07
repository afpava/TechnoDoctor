require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "when Category.new is called" do

  it "validation description shouldn't be blank" do
    category = Category.create(description:"")
    expect(category.errors.messages[:description]).to include("can't be blank")
  end

  it "validation description should be unique" do
    category = Category.create(description:"test")
    category1 = Category.create(description:"test")
    category2 = Category.create(description:"test2")
    expect(category).to be_valid
    expect(category1.errors.messages[:description]).to include("has already been taken")
    expect(category2).to be_valid
  end


  end #Validations

end
