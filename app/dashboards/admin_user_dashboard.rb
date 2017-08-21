require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    password: Field::String,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    firstname: Field::String,
    lastname: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    type: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :posts,
    :email,
    :type
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :posts,
    :email,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :firstname,
    :lastname,
    :created_at,
    :updated_at,
    :type,
  ].freeze

  FORM_ATTRIBUTES = [
    :email,
    :password,
    :firstname,
    :lastname,
  ].freeze
end
