require "administrate/base_dashboard"

class CollaboratorDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tickets: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    nickname: Field::String,
    user: Field::BelongsTo,
    avatar: Field::Carrierwave.with_options(
              image: :standard,
              multiple: false,
              image_on_index: false,
              remove: false,
              remote_url: false
            ),

    ticket_id: Field::Number,
    position: Field::Enum,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :tickets,
    :id,
    :first_name,
    :last_name,
    :avatar,
    :user,
    :position,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :tickets,
    :id,
    :first_name,
    :last_name,
    :nickname,
    # :ticket_id,
    :avatar,
    :user,
    :position,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :avatar,
    :nickname,
    :first_name,
    :last_name,
    :tickets,
    :user,
    :position,
    # :ticket_id,
  ].freeze

  # Overwrite this method to customize how collaborators are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(collaborator)
    "Collaborator -#{collaborator.nickname}"
  end
end
