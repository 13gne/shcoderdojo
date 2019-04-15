namespace :course_registrations do
  task :set_false => :environment do
    CourseRegistration.all.each do |course_registration|
      course_registration.waitlist = false
      course_registration.save
    end
  end
end