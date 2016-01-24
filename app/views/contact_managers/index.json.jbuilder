json.array!(@contact_managers) do |contact_manager|
  json.extract! contact_manager, :id, :first_name, :last_name, :mobile, :email
  json.url contact_manager_url(contact_manager, format: :json)
end
