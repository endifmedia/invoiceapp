json.extract! invoice, :id, :invoice_number, :project_title, :client, :issue_date, :due_date, :description, :status, :notes, :terms, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
