class AddContentToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :content, :text
  end
end
