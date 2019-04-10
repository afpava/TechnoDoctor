require 'rails_helper'

RSpec.describe Collaborator, type: :model do

#  context "validation tests" do
let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_day: '01-01-1900', password:'123test' ) }

context "validate default position" do
  let(:collaborator) {Collaborator.create(first_name: 'testUser', last_name:'testUser', nickname:'Dublicator', user_id: user.id )}
    it "ensures default position is account_reciveble" do
      expect(collaborator.position).to eq ("account_reciveble")
    end
end

context "validate nickname uniqueness" do
    let(:collaborator1) {Collaborator.create(first_name: 'testUser', last_name:'testUser', nickname:'Dublicator', user_id: user.id )}
    let(:collaborator2) {Collaborator.create(first_name: 'testUser', last_name:'testUser', nickname:'Dublicator', user_id: user.id )}
  it "ensures nickname uniqueness" do
    expect(collaborator1).to be_valid
    expect(collaborator2).to be_invalid
  end
end

context "validate first_name presence" do
    let(:collaborator1) {Collaborator.create(first_name: 'testUser', last_name:'testUser', nickname:'Dublicator', user_id: user.id )}
    let(:collaborator2) {Collaborator.create(first_name: nil , last_name:'testUser', nickname:'Dublicator', user_id: user.id )}
  it "ensures first_name present" do
    expect(collaborator1).to be_valid
    expect(collaborator2).to be_invalid
  end
end

context "validate last_name presence" do
    let(:collaborator1) {Collaborator.create(first_name: 'testUser', last_name:'testUser', nickname:'Dublicator', user_id: user.id )}
    let(:collaborator2) {Collaborator.create(first_name: 'testUser', last_name: nil, nickname:'Dublicator', user_id: user.id )}
  it "ensures nickname uniqueness" do
    expect(collaborator1).to be_valid
    expect(collaborator2).to be_invalid
  end
end
#  end #validations

  describe "#full_name" do

      let(:user) { Collaborator.create(nickname: 'Test', first_name: 'First', last_name: 'Super', position: 0 ) }
      let(:blank_first) { Collaborator.create(nickname: 'Blank', first_name: '', last_name: 'Super', position: 1 ) }
      let(:blank_last) { Collaborator.create(nickname: 'Blank', first_name: 'Super', last_name: '', position: 2 ) }

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


end #Collaborator model
