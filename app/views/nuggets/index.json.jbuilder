json.array!(@nuggets) do |nugget|
  json.extract! nugget, :id
  json.url nugget_url(nugget, format: :json)
end
