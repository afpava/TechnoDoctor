class Contact
  include ActiveModel::Model
  attr_accessor :email, :subject, :name, :message

    validates :email,
      presence: :true,
      format: {
        with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
        message: "must be a valid email address"
      }

    validates :subject, presence: true
    validates :name, presence: true
    validates :message, presence: true

end
