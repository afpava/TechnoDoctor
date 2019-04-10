require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "when Contact.new is called" do
    let(:contact) { Contact.new(email:"test@test.com", subject: "subject", name: "name", message: "some long message", ) }
    let(:contact_bl_subj) { Contact.new(email:"test@test.com", subject: "", name: "name", message: "some long message", ) }
    let(:contact_bl_name) { Contact.new(email:"test@test.com", subject: "subject", name: "", message: "some long message", ) }
    let(:contact_bl_message) { Contact.new(email:"test@test.com", subject: "subject", name: "test", message: "", ) }
    let(:contact_ival_email) { Contact.new(email:"test", subject: "subject", name: "test", message: "test", ) }
  #  problem here - should include ActiveModel::Model it's not an ActiveRecord model
  # it "validation subject shouldn't be blank" do
  #   expect(contact_bl_subj.errors.messages[:subject]).to be_invalid
  # end



  end #Validations

end
