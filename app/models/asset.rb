class Asset < ActiveRecord::Base
    belongs_to :car
    
    #paperclip
    has_attached_file :photo,
    :styles => {
    :thumb=> "100x100#",
    :small  => "400x400>",
    :detail  => "499x300#"}
end
