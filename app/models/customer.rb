class Customer < ApplicationRecord
  # before_save :strip_phone_number
# attr_accessor :full_name, :strip_phone_number

  # Setter for sanitizing phone number
  def phone_number=(phone)
    super(phone.delete('^0-9+'))
  end

  has_many :tickets
  has_many :users

  validates :phone_number, presence: true, uniqueness: true
  validates :first_name, presence: true

  accepts_nested_attributes_for :tickets, allow_destroy: true

# Initiate customer on query to add a User relation
  scope :init_customer, -> (phone, ticket_id) {
      where(phone_number: phone ).
      joins(:tickets).where("tickets.id = ?", ticket_id)
  }


  def full_name
    [self.first_name, self.last_name].join(" ") if !self.first_name.blank? && !self.last_name.blank?
  end

  def strip_phone_number
    self.phone_number.gsub!(/[^0-9]/, '')
  end

end
