class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.float :score
      t.text :questions
      t.references :exam, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :time

      t.timestamps
    end
  end
end
