json.array!(@zombies) do |zombie|
  json.extract! zombie, :id, :name, :bio, :age, :rotting, :email
  json.url zombie_url(zombie, format: :json)
end
