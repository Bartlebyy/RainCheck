class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :phone_number
      t.string :zip_code
      t.boolean :alert, default: true
      t.text :update_times

      t.timestamps
    end
  end
end
