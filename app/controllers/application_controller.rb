class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
    
    def layout_by_resource
        if devise_controller?
            "user"
        else
            "application"
        end
    end
    
end
