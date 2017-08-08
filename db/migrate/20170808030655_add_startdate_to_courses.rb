class AddStartdateToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :startdate, :date
  end
end
