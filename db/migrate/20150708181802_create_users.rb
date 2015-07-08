class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name, null: false
      t.boolean :admin, default: false
      t.string  :client_id
      t.string  :secret_id

      t.timestamps null: false
    end
  end
end
