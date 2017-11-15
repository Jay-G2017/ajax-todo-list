class ChangeColumnToTask < ActiveRecord::Migration[5.1]
  def change
    change_table :tasks do |t|
      t.remove :complete
      t.boolean :complete, default: false, null: false
    end
  end
end
