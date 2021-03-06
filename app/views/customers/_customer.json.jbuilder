json.extract! customer, :id, :name, :surname, :document, :email, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
