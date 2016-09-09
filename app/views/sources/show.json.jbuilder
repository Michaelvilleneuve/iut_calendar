json.array!(@events) do |event|
  json.extract! event, :title, :room, :teacher, :description
end