class Shift < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :date, :shift_type, presence: true
end