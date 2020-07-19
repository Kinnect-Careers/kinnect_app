class Opportunity < ApplicationRecord
  has_many :application
  belongs_to :company
  validates :title, :requirements, :description, presence: true
end
