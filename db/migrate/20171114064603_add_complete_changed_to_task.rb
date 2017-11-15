class AddCompleteChangedToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :complete_changed, :boolean, default: false
  end
end
