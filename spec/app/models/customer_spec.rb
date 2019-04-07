require 'rails_helper'

RSpec.describe Customer, type: :model do

#  context "validation tests" do

  context "Validation email presence" do
    let(:user) {User.create(email: '', password:'123test' )}
    it "ensures email presence" do
      expect(user).to be_invalid
    end
  end

  context "validate emai patterns" do
    let(:user) {User.create(email: 'test@test', password:'123test' )}
    it "ensures email pattern" do
      expect(user).to be_invalid
    end
  end

  context "validate email creation" do
    let(:user) {User.create(email: 'test@test.com', password:'123test' )}
    it "ensures email created" do
      expect(user).to be_valid
    end
  end

  context "validate emai uniqueness" do
      let(:user1) {User.create(email: 'test@test.com', password:'123test' )}
      let(:user2) {User.create(email: 'test@test.com', password:'123test' )}
    it "ensures email uniqueness" do
      expect(user1).to be_valid
      expect(user2).to be_invalid
    end
  end

  context "validate email patterns" do
      let(:user) {User.create(email: 'test@test.com', password:'')}
    it "ensures password can't be blank" do
      expect(user).to be_invalid
    end
  end

  context "validate password" do
      let(:user) {User.create(email: 'test@test.com', password:'123456')}
    it "ensures password patterns must contain letters on create" do
      expect(user).to be_invalid
    end
end

  context "validate password" do
      let(:user) {User.create(email: 'test@test.com', password:'qwertyui')}
    it "ensures password must contain digits on create" do
      expect(user).to be_invalid
    end
  end

context "validate password" do
      let(:user) {User.create(email: 'test@test.com', password:'1qwer')}
    it "ensures password length 6 symbols min on create" do
      expect(user).to be_invalid
    end
  end

context "validate password" do
      let(:user) {User.create(email: 'test@test.com', password:'123456789qwer')}
    it "ensures password length 10 symbols max on create" do
      expect(user).to be_invalid
    end
end

context "validate password" do
      let(:user) {User.create(email: 'test@test.com', password:'123test')}
    it "ensures password length 6-10 symbols on create" do
      expect(user).to be_valid
    end
end

context "validate default role" do
      let(:user) {User.create(email: 'test@test.com', password:'123test')}
    it "ensures default role is customer" do
      expect(user.role).to eq ("customer")
    end
end

#  end #validations

  describe "#full_name" do

      let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_day: '01-01-1900', password:'123test' ) }
      let(:blank_first) { User.create(email: 'admin@test.com', nickname: 'Blank', first_name: '', last_name: 'Super', password:'123test' ) }
      let(:blank_last) { User.create(email: 'admin2@test.com', nickname: 'Blank', first_name: 'Super', last_name: '', password:'123test' ) }

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

end #User model
