class Teacher < ApplicationRecord
    has_many :courses
    validates_presence_of :name, :experience

    has_attached_file :teacher_img, styles: { teacher_index: "250x350>", teacher_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates :teacher_img, attachment_presence: true
    validates_attachment_content_type :teacher_img, content_type: /\Aimage\/.*\z/
end
