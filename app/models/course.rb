class Course < ApplicationRecord
    belongs_to :category
    belongs_to :teacher
    validates_associated :category
    validates :category, presence: true

    validates_presence_of :title, :description, :length, :startdate, :register_url
    validates :course_img, attachment_presence: true
    has_attached_file :course_img, styles: { course_index: "250x350>", course_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :course_img, content_type: /\Aimage\/.*\z/
end
