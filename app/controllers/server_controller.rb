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
    
    def cars_list
        @dealer = Dealer.find(params[:id])
        @cars = @dealer.cars.all
        
        respond_to do |format|
            format.html {render 'cars_list.html.erb' }
            format.json { render :json => @dealer.to_json(:include => :cars) }
        end
    end
    
    def car_detail
        @photo_gallery  = params[:photo_gallery]
        @car = Car.find(params[:id])
        @dealer = @car.dealer
        @assets = @car.assets
        
        respond_to do |format|
            format.html {render 'car_detail.html.erb' }
            format.json { render :json => @car.to_json }
        end
    end
end
