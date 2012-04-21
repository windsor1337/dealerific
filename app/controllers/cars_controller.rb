class CarsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cars }
    end
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @car = Car.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car }
    end
  end

  # GET /cars/new
  # GET /cars/new.json
  def new
    @dealer = Dealer.find(params[:dealer_id])
    if (@dealer.id != current_user.dealer_id && current_user.id != @dealer.user_id && !current_user.admin)
        redirect_to dealers_path, notice: 'You do not have permission to modify to add a Car to Dealer!' and return
    end
      
    @car = @dealer.cars.new
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @car }
    end
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
    @dealer = @car.dealer
      if (@dealer.id != current_user.dealer_id && current_user.id != @dealer.user_id && !current_user.admin)
          redirect_to dealers_path, notice: 'You do not have permission to modify this Car!' and return
      end
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(params[:car])
    @dealer = Dealer.find @car.dealer_id
    
      if (@dealer.id != current_user.dealer_id && current_user.id != @dealer.user_id && !current_user.admin)
          redirect_to dealers_path, notice: 'You do not have permission to add a Car to Dealer!' and return
      end
      
    respond_to do |format|
      if @car.save
        format.html { redirect_to @dealer, notice: 'Car was successfully created.' }
        format.json { render json: @car, status: :created, location: @car }
      else
        format.html { render action: "new" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cars/1
  # PUT /cars/1.json
  def update
    @car = Car.find(params[:id])
    @dealer = @car.dealer
    
      if (@dealer.id != current_user.dealer_id && current_user.id != @dealer.user_id && !current_user.admin)
          redirect_to dealers_path, notice: 'You do not have permission to modify Car!' and return
      end
      
    respond_to do |format|
      if @car.update_attributes(params[:car])
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car = Car.find(params[:id])
      @dealer = @car.dealer
      
      if (@dealer.id != current_user.dealer_id && current_user.id != @dealer.user_id && !current_user.admin)
          redirect_to dealers_path, notice: 'You do not have permission to modify Car!' and return
      end
      
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :no_content }
    end
  end
end
