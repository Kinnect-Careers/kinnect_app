class User < ApplicationRecord
  has_many :application
  validates :name, :email, presence: true
end
