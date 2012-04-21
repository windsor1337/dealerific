class AddPhotoToDealer < ActiveRecord::Migration
  def change
    add_column :dealers, :photo, :binary
      
    add_column :dealers, :photo_file_name, :string

    add_column :dealers, :photo_content_type, :string

    add_column :dealers, :photo_file_size, :integer

  end
end
