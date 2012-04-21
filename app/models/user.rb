class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me, :photo
    
  has_many :dealers, :dependent => :destroy
    
  #paperclip
  has_attached_file :photo,
  :styles => {
  :thumb=> "100x100#",
  :small  => "400x400>" }
    
  
end
