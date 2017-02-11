class AddFieldsToUser < ActiveRecord::Migration
  def change
    # Users Fields
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth, :datetime
  end
end
