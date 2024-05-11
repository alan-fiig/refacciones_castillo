class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :work_description
      t.string :status
      t.decimal :initial_payment
      t.decimal :total_pay
      t.integer :telephone
      t.string :address
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
