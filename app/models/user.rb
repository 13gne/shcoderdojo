class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :students
  has_many :course_registrations

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def course_registered(course_id)
    c = CourseRegistration.where(user_id: self.id, course_id: course_id)
    if c.count == 0
      false
    else
      true
    end
  end
end
