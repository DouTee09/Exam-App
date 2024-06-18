class AddColumExpTimeToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :exp_time, :datetime
  end
end
