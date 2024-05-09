class Worker < ApplicationRecord
  has_one_attached :profile_picture
  validates :name, presence: true
  validates :position, presence: true
  validates :age, presence: true, numericality: {:greater_than => 0}
  validates :telephone, presence: true, numericality: {:greater_than => 0}
  validates :salary, presence: true, numericality: {:greater_than => 0}
  validates :address, presence: true
end
