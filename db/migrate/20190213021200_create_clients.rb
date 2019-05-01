class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :contact_name
      t.string :company
      t.string :email
      t.string :fax
      t.string :phone
      t.string :cell
      t.string :website
      t.text :address
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
