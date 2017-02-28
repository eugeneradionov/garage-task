class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true

  default_scope -> { order ('created_at DESC') }
  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }
end
