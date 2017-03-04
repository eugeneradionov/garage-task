class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true, length: {in: 1..1000}

  default_scope -> { order ('created_at DESC') }
  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }
end
