class ShipmentsController < ApplicationController
  # GET /shipments
  # GET /shipments.xml
  def index
    @shipments = Shipment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shipments }
    end
  end

  # GET /shipments/1
  # GET /shipments/1.xml
  def show
    @shipment = Shipment.find(params[:id])
    @goods_to_deliver =  Good.find_all_by_shipment_id_and_action(@shipment.id, 'Deliver')
    @goods_to_pickup =  Good.find_all_by_shipment_id_and_action(@shipment.id, 'Pickup')
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shipment }
    end
  end

  # GET /shipments/new
  # GET /shipments/new.xml
  def new
    @shipment = Shipment.new
    5.times { @shipment.goods.build }


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shipment }
    end
  end

  # GET /shipments/1/edit
  def edit
    @shipment = Shipment.find(params[:id])
  end

  # POST /shipments
  # POST /shipments.xml
  def create
    @shipment = Shipment.new(params[:shipment])
    respond_to do |format|
      if @shipment.save
        format.html { redirect_to(@shipment, :notice => 'Shipment was successfully created.') }
        format.xml  { render :xml => @shipment, :status => :created, :location => @shipment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shipments/1
  # PUT /shipments/1.xml
  def update
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      if @shipment.update_attributes(params[:shipment])
        format.html { redirect_to(@shipment, :notice => 'Shipment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.xml
  def destroy
    @shipment = Shipment.find(params[:id])
    @shipment.destroy

    respond_to do |format|
      format.html { redirect_to(shipments_url) }
      format.xml  { head :ok }
    end
  end
  
  def find_member
    @member = Membership.find_by_card_id(params[:card])
    render 'find_member', :layout => false
  end
  
  def find_book
    @book = Book.find(params[:book_no])
    @col_name = params[:col_name]
    render 'find_book', :layout => false
  end

end
