require "administrate/base_dashboard"

class TicketDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    customer: Field::BelongsTo,
    device: Field::BelongsTo,
    collaborator: Field::BelongsTo,
    disrepares: Field::HasMany,
    operations: Field::HasMany,
    user: Field::HasOne,
    parts: Field::HasMany,
    id: Field::Number,
    orient_price: Field::Number.with_options(decimals: 2),
    prepayment: Field::Number,
    stage: Field::String.with_options(searchable: false),
    in_date: Field::DateTime,
    orient_date: Field::DateTime,
    total_price: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :customer,
    :device,
    :collaborator,
    :disrepares,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :customer,
    :device,
    :collaborator,
    :disrepares,
    :operations,
    :user,
    :parts,
    :id,
    :orient_price,
    :prepayment,
    :stage,
    :in_date,
    :orient_date,
    :total_price,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :customer,
    :device,
    :collaborator,
    :disrepares,
    :operations,
    :user,
    :parts,
    :orient_price,
    :prepayment,
    :stage,
    :in_date,
    :orient_date,
    :total_price,
  ].freeze

  # Overwrite this method to customize how tickets are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(ticket)
  #   "Ticket ##{ticket.id}"
  # end
end
