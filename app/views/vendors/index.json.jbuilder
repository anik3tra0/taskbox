json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :name, :company, :mobile, :email
  json.url vendor_url(vendor, format: :json)
end
