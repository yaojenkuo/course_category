class Teacher < ApplicationRecord
    extend FriendlyId
    friendly_id :name, :use => :scoped, :scope => :category
    has_many :courses

    has_attached_file :teacher_img, styles: { teacher_index: "250x350>", teacher_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :teacher_img, content_type: /\Aimage\/.*\z/
end
