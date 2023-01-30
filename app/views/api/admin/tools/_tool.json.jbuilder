# frozen_string_literal: true

json.extract! tool, :id, :code, :name, :brand, :place_name, :kind, :observations, :place_id, :created_at, :updated_at
json.image_url rails_blob_url(tool.image) if tool.image.attached?
