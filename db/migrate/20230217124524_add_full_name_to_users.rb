class AddFullNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fullName, :string
  end
end
