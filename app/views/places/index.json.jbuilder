# frozen_string_literal: true

json.places @places do |place|
  json.extract! place, :id, :name, :place_id
end
