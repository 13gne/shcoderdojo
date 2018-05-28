# == Schema Information
#
# Table name: users
#
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  experience             :string
#  grade                  :string
#  id                     :integer          not null, primary key
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_id          :integer
#  invited_by_type        :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  mobile_number          :string
#  name                   :string
#  parent_name            :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  updated_at             :datetime         not null
#  username               :string
#
# Indexes
#
#  index_users_on_invitation_token      (invitation_token) UNIQUE
#  index_users_on_invitations_count     (invitations_count)
#  index_users_on_invited_by_id         (invited_by_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ActiveRecord::Base
  attr_accessor :parent_or_student

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :students, dependent: :destroy
  has_many :course_registrations, dependent: :destroy

  def current_registrations
    self.course_registrations.joins(:course).where( courses: { current: true })
  end
  
  def course_registered(course_id)
    c = CourseRegistration.where(user_id: self.id, course_id: course_id)
    if c.count == 0
      false
    else
      true
    end
  end

  def name
    self.read_attribute(:name) || 'Unknown'
  end

  def no_students?
    self.students.count < 1
  end

  def number_of_students
    self.students.count
  end

  def registration_not_complete?
    return true if self.name.nil?
    return true if self.mobile_number.nil?
  end

end
