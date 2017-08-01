class AddRegisterUrlToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :register_url, :string
  end
end
