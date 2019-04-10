class User < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :feedbacks
  has_one :collaborator

  attr_accessor :full_name, :age, :birthdays_this_month, :search_customer, :add_customer_relation


  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, ImageUploader


  email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :email, presence: true, uniqueness: true, format: email_regex
  validates :password, format: { with: /(?=.*?[0-9])(?=.*?[A-Za-z]).+/,
      message: "Password must contain at least one digit and one letter" }, length: { in: 6..10 }, on: :create

  validates :password, format: { with: /(?=.*?[0-9])(?=.*?[A-Za-z]).+/,
          message: "Password must contain at least one digit and one letter" }, length: { in: 6..10 }, on: :update, if: :password_digest_changed?

  has_secure_password
  enum role: [:customer, :reception, :master, :admin]

  def self.find_or_create_from_auth_hash(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.nickname = auth.info.name
        user.email = auth.info.email
        user.remote_avatar_url = auth.info.image
        user.password = user.password_confirmation = '1' +SecureRandom.urlsafe_base64(n=6, false)
        user.save!
      end
    end


  def full_name
    [self.first_name, self.last_name].join(" ")
  end

  def age
    ((Time.now - self.birth_day.to_time) / 1.year.seconds).floor
  end

  def birthday_today?
    return nil unless self.birth_day?
    Date.today.strftime('%m%d') == self.birth_day.strftime('%m%d')
  end

  def self.birthdays_today
    User.where("strftime('%m%d', birth_day) = ?", Date.today.strftime('%m%d'))
  end

  def add_customer_relation(ticket_id, phone_number)

    phone = phone_number.delete('^0-9+')
    customer_id = Customer.init_customer(phone, ticket).pluck(:id).first
    user = self
    customer = Customer.find(ticket_id)
    customer.users << user if customer.present?
  end
end
