require 'rails_helper'

RSpec.describe Feedback, type: :model do
  let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_day: "01-01-1900", password:"123test" ) }
  let(:user1) { User.create(email: 'test1@test.com', nickname: 'Test1', first_name: 'First1', last_name: 'Super1', birth_day: "01-01-1900", password:"123test" ) }

  describe "when Feedback.new is called" do

      it "should be ok with an associated feedback" do
        feedback = user.feedbacks.create(title:"test",text:"test")
        expect(feedback).to be_valid
      end

      it "validation Feedback shouldn't be blank" do
        feedback = user.feedbacks.create(title:"",text:"test")
        expect(feedback.errors.messages[:title]).to include("can't be blank")
      end

      it "validation Feedback shouldn't be blank" do
        feedback = user.feedbacks.create(title:"test",text:"")
        expect(feedback.errors.messages[:text]).to include("can't be blank")
      end

      it "validation Feedback title and text should be unique only for exect User" do
        feedback = user.feedbacks.create(title:"test",text:"test")
        feedback1 = user.feedbacks.create(title:"test",text:"test")
        feedback2 = user1.feedbacks.create(title:"test",text:"test")
        expect(feedback).to be_valid
        expect(feedback1.errors.messages[:title]).to include("Title exists!")
        expect(feedback1.errors.messages[:text]).to include("Text exists!")
        expect(feedback2).to be_valid
      end

  end #Validations

  # describe "Feedback methods" do
  #   before do
  #     task = user.tasks.create(title:"test1",text:"test1", completed: true)
  #     task1 = user.tasks.create(title:"test2",text:"test2", completed: false)
  #     task2 = user.tasks.create(title:"test3",text:"test3")
  #   end
  #
  #   it "should be 2 uncompleted tasks" do
  #     expect(user.tasks.uncompleted_tasks_count).to eq 2
  #   end
  #
  #   it "should be 3 tasks" do
  #     expect(user.tasks.total_tasks_count).to eq (user.tasks.size)
  #   end
  #
  #   it "should include uncompleted tasks" do
  #     expect(user.tasks.tasks_uncompleted).to include (user.tasks.where(completed: [false, nil]).first)
  #     expect(user.tasks.tasks_uncompleted.size).to eq 2
  #   end
  #
  #   it "should include completed tasks" do
  #     expect(user.tasks.tasks_completed).to include (user.tasks.where(completed: true).first)
  #     expect(user.tasks.tasks_completed.size).to eq 1
  #   end
  #
  # end#Uncompleted tasks



end #Rspec
