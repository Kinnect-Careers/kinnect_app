class Company < ApplicationRecord
  has_many :opportunities
  
  before_save { email.downcase! }
  
  validates :image_url, presence: true
  validates :name, presence: true, 
                   length: { minimum: 4, maximum: 80},
                   uniqueness: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { minimum: 7, maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validate :password_uppercase
  validate :password_lowercase
  validate :password_special_char
  validate :password_contains_number
  
  def password_uppercase
    return if !!password.match(/\p{Upper}/)
    errors.add :password, ' must contain at least 1 uppercase letter'
  end
  
  def password_lowercase
    return if !!password.match(/\p{Lower}/)
    errors.add :password, ' must contain at least 1 lowercase letter'
  end
  
  def password_special_char
    special = "?-$}{[]*`<>!^=)('%]&#~{}!"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return if password =~ regex
    errors.add :password, 'must contain special characters'
  end
  
  def password_contains_number
    return if password.count("0-9") > 0
    errors.add :password, ' must contain at least one number'
  end
  
  def Company.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
