class DealersController < ApplicationController
    before_filter :authenticate_user!
    before_filter :user_can_modify!, :only => [:new, :edit, :create, :destroy]
    
  # GET /dealers
  # GET /dealers.json
  def index
      @user = current_user
    if @user.admin
        @dealers = Dealer.all
    elsif @user.reseller
        @dealers = current_user.dealers
    elsif @user.dealer
        @dealer = Dealer.find(@user.dealer_id)
        redirect_to @dealer and return
    else
        #redirect_to No Access Page
    end
    
    #if !@dealers redirect_to NO Access Page
      
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @dealers }
    end
  end

  # GET /dealers/1
  # GET /dealers/1.json
  def show
    if current_user.dealer then
        @dealer = Dealer.find current_user.dealer_id
    elsif current_user.reseller then
        @dealer = Dealer.find(params[:id])
        if !@dealer || @dealer.user.id != current_user.id
            @dealer = current_user.dealers.first
        end
    else
        @dealer = Dealer.find(params[:id])
    end
    
    @cars = @dealer.cars
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dealer }
    end
  end

  # GET /dealers/new
  # GET /dealers/new.json
  def new
    if !current_user.admin && !current_user.reseller then
        redirect_to dealers_path, notice: 'You do not have permission to create a Dealer!' and return
    end
    @dealer = Dealer.new
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dealer }
    end
  end

  # GET /dealers/1/edit
  def edit
    @dealer = Dealer.find(params[:id])
      
    if (@dealer.user_id != @user.id && @dealer.id != @user.dealer_id && !@user.admin)
       redirect_to dealers_path, notice: 'You do not have permission to modify!'
    end

  end

  # POST /dealers
  # POST /dealers.json
  def create
    if !current_user.admin && !current_user.reseller then
        redirect_to dealers_path, notice: 'You do not have permission to create a Dealer!' and return
    end
      
    @dealer = Dealer.new(params[:dealer])
    @dealer.user_id = current_user.id
      
    respond_to do |format|
      if @dealer.save
        format.html { redirect_to @dealer, notice: 'Dealer was successfully created.' }
        format.json { render json: @dealer, status: :created, location: @dealer }
      else
        format.html { render action: "new" }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dealers/1
  # PUT /dealers/1.json
  def update
    @dealer = Dealer.find(params[:id])
    @user = current_user
      
    if (@dealer.user_id != @user.id && @dealer.id != @user.dealer_id && !@user.admin)
        redirect_to dealers_path, notice: 'You do not have permission to modify Dealer!' and return
    end

      
    respond_to do |format|
      if @dealer.update_attributes(params[:dealer])
        format.html { redirect_to @dealer, notice: 'Dealer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealers/1
  # DELETE /dealers/1.json
  def destroy
    @dealer = Dealer.find(params[:id])
    
    if (@dealer.user_id != @user.id && @dealer.id != @user.dealer_id && !@user.admin)
       redirect_to dealers_path, notice: 'You do not have permission to modify Dealer!' and return
    end
      
    @dealer.destroy

    respond_to do |format|
      format.html { redirect_to dealers_url }
      format.json { head :no_content }
    end
  end
    
  def user_can_modify!
    @user = current_user
    return @user.admin || @user.reseller
  end
    
end
