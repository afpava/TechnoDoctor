require 'rails_helper'

RSpec.describe Customer, type: :model do
let(:user) {User.create(email: 'test@test.com', password:'123test' )}
let(:customer_valid) {Customer.create(first_name: 'test', last_name:'123test', phone_number:'1234567', user_id: user.id  )}
#  context "validation tests" do

  context "Validation first_name presence" do
    let(:customer) {Customer.create(first_name: '', last_name:'123test', phone_number:'1234567', user_id: user.id  )}
    it "ensures first_name presence" do
      expect(customer).to be_invalid
    end
  end

  context "validate phone_number presence" do
    let(:customer) {Customer.create(first_name: '123test', phone_number:'1234567', user_id: user.id  )}
    let(:customer_bl) {Customer.create(first_name: '123test2', phone_number:'', user_id: user.id  )}
    it "ensures last_name presence" do
      expect(customer).to be_valid
      expect(customer_bl).to be_invalid
    end
  end

  context "validate phone_number uniqueness" do
    let(:customer) {Customer.create(first_name: '123test', phone_number:'1234567', user_id: user.id  )}
    let(:customer_bl) {Customer.create(first_name: '123test2', phone_number:'1234567', user_id: user.id  )}
    it "ensures customer created" do
      expect(customer).to be_valid
      expect(customer_bl).to be_invalid
    end
  end

  it "applies a default scope to collections by category" do
   expect(Customer.init_customer("12345678","123").to_sql).to eq Customer.where(phone_number:"12345678").joins(:tickets).where("tickets.id = ?", "123").to_sql
 end

#  end #validations

  describe "#full_name" do

      let(:user) { Customer.create(first_name: 'First', last_name: 'Super', phone_number:'1234567') }
      let(:blank_first) { Customer.create(first_name: '', last_name: 'Super', phone_number:'1234568' ) }
      let(:blank_last) { Customer.create(first_name: 'Super', last_name: '' , phone_number:'1234569') }

    it "should return full_name on fist_name and last_name presence" do
      expect(user.full_name).to eq (user.first_name + " " + user.last_name)
    end

    it "shoud return last_name if first_name is blank" do
      expect(blank_first.full_name).to eq (" " + blank_first.last_name)
    end

    it "shoud return first_name if last_name is blank" do
      expect(blank_last.full_name).to eq (blank_last.first_name + " ")
    end


  end #fill_name


    describe "#strip_phone_number" do

      let(:customer_wrong_number) { Customer.create(first_name: 'Super', last_name: '' , phone_number:'+12 34-569F') }
      it "should return full_name on fist_name and last_name presence" do
        expect(customer_wrong_number.strip_phone_number).to eq ("1234569")
      end

    end #strip_phone_number

end #User model
