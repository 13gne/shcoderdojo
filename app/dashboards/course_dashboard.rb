require "administrate/base_dashboard"

class CourseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    course_registrations: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    description: Field::Text,
    max_students: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :course_registrations,
    :id,
    :name,
    :start_date,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :course_registrations,
    :id,
    :name,
    :start_date,
    :end_date,
    :description,
    :max_students,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :course_registrations,
    :name,
    :start_date,
    :end_date,
    :description,
    :max_students,
  ]

  # Overwrite this method to customize how courses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(course)
  #   "Course ##{course.id}"
  # end
end
