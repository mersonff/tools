# frozen_string_literal: true

json.places @tools do |tool|
  json.extract! tool, :id, :name, :code, :brand, :kind, :observations, :place_id, :created_at, :updated_at
end

json.partial! partial: 'shared/pagination', locals: {
  kind: @tools
}
