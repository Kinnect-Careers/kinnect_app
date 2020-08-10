class User
  @first_name
  @last_name

  def initialize(user_id, age)
    @id = user_id
    @age = age
  end

  # set
  def set_first_name(name)
    @first_name = name
  end

  def set_last_name(name)
    @last_name = name
  end

  # get
  def get_id
    @id
  end

  def get_first_name
    @first_name
  end

  def get_last
    @last_name
  end

  def get_age
    @age
  end

  def is_instructor
    false
  end

  def get_course_enrollments
  end

end
