class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_number
      t.string :project_title
      t.string :client
      t.date :issue_date
      t.date :due_date
      t.text :description
      t.string :status
      t.text :notes
      t.text :terms
      t.string :invoice_items
      
      #t.string :item_description
      #t.string :item_qty
      #t.string :item_rate
      #t.string :item_amount

      t.string :subtotal
      t.string :tax_total
      t.string :items_total

      t.timestamps
    end
  end
end
