# frozen_string_literal: true

json.place do
  json.extract! @place, :name, :place_name, :place_id
end
