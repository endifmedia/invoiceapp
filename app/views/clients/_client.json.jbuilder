json.extract! client, :id, :contact_name, :company, :email, :fax, :phone, :cell, :website, :address, :address_2, :city, :state, :zip, :created_at, :updated_at
json.url client_url(client, format: :json)
