require_relative 'message.rb'
require_relative 'setup.rb'

users = load_users # array of users
courses = load_courses # array of course
instructors = load_instructors # array of instructors
enrollments = load_enrollments # array of enrollments
course_instructors = load_course_instructors # array of instructors and their courses

users.each do |user|
  puts "#{user.get_id}|#{user.get_first_name} #{user.get_last}  #{user.get_age}"
end
instructors.each do |instructor|
  puts "#{instructor}"
end
enrollments.each do |enrollment|
  puts "#{enrollment}"
end
course_instructors.each do |data|
  puts "#{data}"
end
courses.each do |course|
  puts "#{course.get_id}|#{course.get_name} #{course.get_start_date} #{course.get_end_date}"
end
