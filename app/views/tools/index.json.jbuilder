# frozen_string_literal: true

json.tools @tools do |tool|
  json.extract! tool, :id, :name, :code, :brand, :place_name, :observations, :place_id, :created_at, :updated_at
  json.kind t(tool.kind, scope: 'kinds')
end

json.kinds Tool.kinds.each do |kind, key|
  json.key key
  json.name t(kind, scope: 'kinds')
end

json.partial! partial: 'shared/pagination', locals: {
  kind: @tools
}
