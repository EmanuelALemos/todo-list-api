class Task < ApplicationRecord
  belongs_to :column

  validates :title, presence: true
  validates :due_date, presence: true
  validates :priority, inclusion: { in: [1, 2, 3] }, allow_nil: true  # 1 = alta, 2 = média, 3 = baixa

  before_create :set_default_priority

  private

  def set_default_priority
    self.priority ||= 3 
  end
end
