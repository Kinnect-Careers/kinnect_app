class Experience < ApplicationRecord
  belongs_to :user
  default_scope -> { order(started_at: :desc) }
  
  validates :user_id, presence: true
  validates :company, presence: true, length: { maximum: 100 }
  validates :started_at, presence: true
  
  before_save :set_current
  
  def current?
    return self.current
  end
  
  private
    def set_current
      self.current = self.ended_at.nil?
    end
  
end
