class Course
  @id
  @name
  @instructor


  def initialize(course_id, name)
    @id = course_id
    @name = name
  end

  def assign_instructor(instructor_id)
    @instructor = instructor_id
  end

  def set_dates(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def enroll_student(student)
    puts "Enrolled student to course"
  end

  def get_id
    @id
  end

  def get_name
    @name
  end

  def get_start_date
    @start_date
  end

  def get_end_date
    @end_date
  end


end
