require "administrate/base_dashboard"

class OperationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tickets: Field::HasMany,
    category: Field::BelongsTo,
    id: Field::Number,
    description: Field::String,
    price: Field::Number.with_options(decimals: 2),
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
    :tickets,
    :category,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :tickets,
    :category,
    :id,
    :description,
    :price,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :tickets,
    :category,
    :description,
    :price,
  ].freeze

  # Overwrite this method to customize how operations are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(operation)
    "Operation -#{operation.description}"
  end
end
