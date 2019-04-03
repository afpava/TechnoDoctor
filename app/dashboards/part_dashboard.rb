require "administrate/base_dashboard"

class PartDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    ticket: Field::BelongsTo,
    id: Field::Number,
    description: Field::String,
    price: Field::Number.with_options(decimals: 2, prefix: "$",),
    quantity: Field::Number,
    ticket_id: Field::Number,
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
    :description,
    :price,
    :ticket,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :ticket,
    :id,
    :description,
    :price,
    :quantity,
    :ticket_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ticket,
    :description,
    :price,
    :quantity,
    :ticket_id,
  ].freeze

  # Overwrite this method to customize how parts are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(part)
    "Part -#{part.description}"
  end
end
