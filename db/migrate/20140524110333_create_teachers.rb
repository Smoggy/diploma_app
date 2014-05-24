class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.boolean :is_candidate
      t.references :subject
      t.timestamps
    end
  end
end
