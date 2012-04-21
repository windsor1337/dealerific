class ServerController < ApplicationController
    layout "mobile"
    
    def overview
        @dealer = Dealer.find(params[:id])
        @cars = @dealer.cars.all
        
        respond_to do |format|
            format.html {render 'index.html.erb' }
            format.json { render :json => @dealer.to_json(:include => :cars) }
        end
    end
end
