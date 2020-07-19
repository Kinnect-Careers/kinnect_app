class Company < ApplicationRecord
  has_many :opportunities
  validates :image_url, :name, :email, presence: true
end
