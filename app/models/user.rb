class User < ApplicationRecord
  has_many :application
  
  attr_accessor :remember_token

  before_save { email.downcase! }

  validates :name, presence: true, 
                   length: { minimum: 4, maximum: 50}
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { minimum: 7, maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validate :password_uppercase
  validate :password_lowercase
  validate :password_special_char
  validate :password_contains_number
  
  def password_uppercase
    return if password && !!password.match(/\p{Upper}/)
    errors.add :password, ' must contain at least 1 uppercase letter'
  end
  
  def password_lowercase
    return if password && !!password.match(/\p{Lower}/)
    errors.add :password, ' must contain at least 1 lowercase letter'
  end
  
  def password_special_char
    special = "?-$}{[]*`<>!^=)('%]&#~{}!"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return if password && password =~ regex
    errors.add :password, 'must contain special characters'
  end
  
  def password_contains_number
    return if password && password.count("0-9") > 0
    errors.add :password, ' must contain at least one number'
  end
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Gets a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Remembers user in db, used for persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Checks if user has been given a token that matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)    
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
end
