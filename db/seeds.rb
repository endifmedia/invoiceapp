Client.create!([
  {contact_name: "Greg Philips", company: "Plow", email: "gphilips@gmail.com", fax: "", phone: "", cell: "", website: "plowdigital.com", address: "East St. Joseph Street ", address_2: "", city: "Indianapolis", state: "IN", zip: "46202"}
])
Invoice.create!([
  {invoice_number: 1, project_title: "Ivy Tech Project", client: "Plow", issue_date: nil, due_date: nil, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", status: "", notes: "", terms: "due upon receipt", invoice_items: {"0"=>{"description"=>"HTML to WordPress theme", "qty"=>"32", "rate"=>"22", "total"=>"704.00"}}, subtotal: "704.00", tax_total: "0.00", items_total: "704.00"}
])
