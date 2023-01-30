# frozen_string_literal: true

json.extract! place, :id, :name, :place_id, :place_name, :created_at, :updated_at
json.children place.children do |child|
  json.extract! child, :id, :name, :place_id, :created_at, :updated_at
end
