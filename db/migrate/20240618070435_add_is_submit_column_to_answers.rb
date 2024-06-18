class AddIsSubmitColumnToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :isSubmit, :boolean, default: false
  end
end
