class AddUserFlagsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dealer_id, :integer
    add_column :users, :dealer, :boolean  

    add_column :users, :reseller_id, :integer
    add_column :users, :reseller, :boolean

  end
end
