json.extract! account, :id, :number, :balance, :created_at, :updated_at
json.url account_url(account, format: :json)
