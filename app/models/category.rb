class Category < ApplicationRecord
    extend FriendlyId
    has_many :courses
    friendly_id :title, use: [:slugged, :finders]
    friendly_id :name, use: [:slugged, :finders]
end
