json.extract! employee, :id, :family, :name, :adress, :phone, :description, :position_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)