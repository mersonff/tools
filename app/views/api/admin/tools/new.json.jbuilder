# frozen_string_literal: true

json.tool do
  json.extract! @tool, :name, :brand, :place_name, :observations, :place_id
  json.kinds Tool.kinds.each do |name, _|
    json.key name
    json.name t(name, scope: 'kinds')
  end
end
