class Feedback < ApplicationRecord
  belongs_to :user

	validates :title, presence: true, uniqueness: { scope: :user,
		message: "Title exists!" }
	validates :text, presence: true, uniqueness: { scope: :user,
		message: "Text exists!" }
	
	enum status: [:unpublished, :published]

	after_initialize do
      if self.new_record?
        self.status ||= :unpublished
      end
	end

    scope :random, -> (limit = 5) {
       order(Arel.sql('RANDOM()')).
       limit(limit)
     }

end
