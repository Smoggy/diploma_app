class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|

      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :email
      t.integer :group_id
      t.integer :school_id	
      t.timestamps
    end
  end
end
