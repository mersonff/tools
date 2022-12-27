# frozen_string_literal: true

json.tool do
  json.extract! @tool, :name, :brand, :kind, :observations, :place_id
end
