class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :position
      t.integer :salary
      t.integer :age
      t.integer :telephone
      t.string :address

      t.timestamps
    end
  end
end
