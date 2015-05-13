class AddResponsableToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :user_res, :integer
  end
end
