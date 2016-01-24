json.array!(@billings) do |billing|
  json.extract! billing, :id, :client_id, :project_id, :total_amount
  json.url billing_url(billing, format: :json)
end
