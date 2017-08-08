class Course < ApplicationRecord
    
    belongs_to :category
    belongs_to :teacher

    has_attached_file :course_img, styles: { course_index: "250x350>", course_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :course_img, content_type: /\Aimage\/.*\z/
end
