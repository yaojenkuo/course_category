class Category < ApplicationRecord
    extend FriendlyId
    has_many :courses
    friendly_id :title, :use => :slugged
    friendly_id :name, :use => :slugged
end
