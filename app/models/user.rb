class User < ApplicationRecord
  has_many :application
  
  before_save { email.downcase! }

  validates :name, presence: true, 
                   length: { minimum: 4, maximum: 50}
                   
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { minimum: 7, maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 } 
end
