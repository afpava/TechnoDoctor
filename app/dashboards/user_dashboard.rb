require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    customer: Field::HasOne,
    feedbacks: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    nickname: Field::String,
    avatar: Field::Carrierwave.with_options(
                  image: :standard,
                  multiple: false,
                  image_on_index: false,
                  remove: false,
                  remote_url: false
                ),
    first_name: Field::String,
    last_name: Field::String,
    password: Field::Password,
    birth_day: Field::DateTime,
    uid: Field::String,
    provider: Field::String,
    phone_number: Field::String,
    role: Field::Enum,
    customer_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :email,
    :feedbacks,
    :customer,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :customer,
    :feedbacks,
    :email,
    :nickname,
    :avatar,
    :first_name,
    :last_name,
    # :password_digest,
    :birth_day,
    :uid,
    :provider,
    :phone_number,
    :role,
    :customer_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :customer,
    :feedbacks,
    :email,
    :nickname,
    :avatar,
    :first_name,
    :last_name,
    :password,
    # :password_digest,
    :birth_day,
    :uid,
    :provider,
    :phone_number,
    :role,
    # :customer,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "User #{user.full_name}"
  end
end
