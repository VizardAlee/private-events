class Event < ApplicationRecord
  belongs_to :created_by, class_name: 'User', foreign_key: 'creator_id'
end
