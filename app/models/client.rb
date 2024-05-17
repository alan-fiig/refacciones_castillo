class Client < ApplicationRecord
  validates :name, presence: true
  validates :work_description, presence: true
  validates :initial_payment, presence: true, numericality: {:greater_than => 0}
  validates :total_pay, presence: true, numericality: {:greater_than => 0}
  validates :telephone, presence: true, format: { with: /\A\d{10}\z/, message: "Debe tener exactamente 10 dígitos" }
  validates :address, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
