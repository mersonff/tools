# frozen_string_literal: true

json.tool do
  json.partial! 'tools/tool', tool: @tool
  json.kinds Tool.kinds.each do |name, _|
    json.key name
    json.name t(name, scope: 'kinds')
  end
end
