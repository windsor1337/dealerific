class AddUseridToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :user_id, :int

  end
end
