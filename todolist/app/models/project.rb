class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: {in: 1..200}
  validates_associated :tasks
end
