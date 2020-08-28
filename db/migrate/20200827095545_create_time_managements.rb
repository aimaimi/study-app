class CreateTimeManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :time_managements do |t|
      t.time       :time, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
