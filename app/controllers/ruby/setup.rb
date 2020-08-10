#
# We won't look at this file; modify if needed
#

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file}

def load_users
  data=[]
  File.foreach('data/users.txt') do |line|
    record = clean_and_split(line, ',')
    user = User.new(record[0], record[3])
    user.set_first_name(record[1])
    user.set_last_name(record[2])
    data.push user
  end
  data
end

def load_instructors
  data=[]
  File.foreach('data/instructors.txt') do |line|
    record = clean_and_split(line, '|')
    instructor = {
      :id => record[0],
      :first_name => record[1],
      :last_name => record[2],
      :dob => record[3]
    }
    data.push instructor
  end
  data
end

def load_courses
  data=[]
  File.foreach('data/courses.txt') do |line|
    record = clean_and_split(line, '|')
    course= Course.new(record[0],record[1])
    course.set_dates(record[2],record[3])
    data.push course
  end
  data
end

def load_enrollments
  data=[]
  File.foreach('data/course_users.txt') do |line|
    record = clean_and_split(line, ',')
    enrollment = {
      :user_id => record[0],
      :course_id => record[1]
    }
    data.push enrollment
  end
  data
end

def load_course_instructors
  data=[]
  File.foreach('data/course_instructors.txt') do |line|
    record = clean_and_split(line, ',')
    enrollment = {
      :instructor => record[0],
      :course_id => record[1]
    }
    data.push enrollment
  end
  data
end

def clean_and_split(line, delimiter)
  line.delete!("\n")
  line.delete!("\r")
  line.split(delimiter)
end
