class AddAttachmentCourseImgToCourses < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.attachment :course_img
    end
  end

  def self.down
    remove_attachment :courses, :course_img
  end
end
