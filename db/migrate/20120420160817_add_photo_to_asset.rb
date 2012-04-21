class AddPhotoToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :photo_file_name, :string

    add_column :assets, :photo_content_type, :string

    add_column :assets, :photo_file_size, :integer

  end
end
