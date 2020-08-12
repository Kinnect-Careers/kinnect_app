class User < ApplicationRecord
  has_many :application
  
  attr_accessor :remember_token, :activation_token, :reset_token

  before_save :downcase_email
  before_create :create_activation_digest
  

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
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)    
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end

  def downcase_email
      self.email = email.downcase
  end
  
  # Activates an account
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end
  
  # Send activation email
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  
  # Created reset digest
  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest:  User.digest(reset_token),
                   reset_sent_at: Time.zone.now)
  end
  
  # Sends password reset email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  # Checks if password reset is expired
  def password_reset_expired?
    reset_sent_at < 15.minutes.ago
  end
  
  private

    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
    
end
