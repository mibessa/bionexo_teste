class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.integer :id_unit
      t.string :name
      t.string :address
      t.string :city
      t.string :phone
      t.float :geocode_lat
      t.float :geocode_long
      t.integer :score_size
      t.integer :score_adptation_for_seniors
      t.integer :score_medical_equipment
      t.integer :score_medicine

      t.timestamps
    end
  end
end
