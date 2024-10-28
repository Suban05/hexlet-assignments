class Task < ApplicationRecord
  validates :name, :status, :creator, presence: true
end
