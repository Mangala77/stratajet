class CreateNotAms < ActiveRecord::Migration
  def change
    create_table :not_ams do |t|
      t.text :notam_data

      t.timestamps null: false
    end
  end
end
