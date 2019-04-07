require 'rails_helper'

RSpec.describe Disrepare, type: :model do
  describe "when Disrepare.new is called" do
  let(:category) {Category.create(description:"test")}
  let(:category2) {Category.create(description:"test2")}
  it "validation description shouldn't be blank" do
    disrepare = Disrepare.create(description:"", category_id: category.id)
    expect(disrepare.errors.messages[:description]).to include("can't be blank")
  end

  it "validation description should be unique in category" do
    disrepare = Disrepare.create(description:"test", category_id: category.id)
    disrepare1 = Disrepare.create(description:"test", category_id: category.id)
    disrepare2 = Disrepare.create(description:"test", category_id: category2.id)
    expect(disrepare).to be_valid
    expect(disrepare1.errors.messages[:description]).to include("Disrepare exists!")
    expect(disrepare2).to be_valid
  end


  end #Validations

end
