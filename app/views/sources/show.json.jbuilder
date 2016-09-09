json.array!(@events) do |event|
  json.extract! event, :title, :room, :teacher, :description, :starts_at, :ends_at
end