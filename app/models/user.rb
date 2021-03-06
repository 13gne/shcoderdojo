# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  role                   :integer
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#  username               :string
#  parent_name            :string
#  grade                  :string
#  experience             :string
#  mobile_number          :string
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
