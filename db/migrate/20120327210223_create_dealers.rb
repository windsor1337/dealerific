class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :sales_phone
      t.string :service_phone
      t.string :email
      t.string :hours_of_operation
      t.string :website_url
      t.string :mobile_website_url
      t.string :facebook
      t.string :twitter
      t.string :logo_url

      t.timestamps
    end
  end
end
