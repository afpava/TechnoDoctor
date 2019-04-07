require 'rails_helper'

RSpec.describe Collaborator, type: :model do

#  context "validation tests" do

context "validate default position" do
      let(:user) {Collaborator.create(nickname: 'Test', first_name: 'First', last_name: 'Super')}
    it "ensures default position is account_reciveble" do
      expect(user.position).to eq ("account_reciveble")
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
