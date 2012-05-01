class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :phone
      t.string :first_name
      t.string :last_name
      t.datetime :when
      t.integer :job_id

      t.timestamps
    end
  end
end
