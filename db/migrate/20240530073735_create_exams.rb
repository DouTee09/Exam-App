class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :time
      t.text :questions
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
