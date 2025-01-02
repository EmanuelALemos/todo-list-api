class Column < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
  validates :color, presence: true
end
