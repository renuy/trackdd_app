class GoodsController < ApplicationController
  # GET /goods
  # GET /goods.xml
  def index
    @goods = Goods.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goods }
    end
  end

  # GET /goods/1
  # GET /goods/1.xml
  def show
    @good = Goods.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @good }
    end
  end

  # GET /goods/new
  # GET /goods/new.xml
  def new
    @good = Goods.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @good }
    end
  end

  # GET /goods/1/edit
  def edit
    @good = Goods.find(params[:id])
  end

  # POST /goods
  # POST /goods.xml
  def create
    @good = Goods.new(params[:good])

    respond_to do |format|
      if @good.save
        format.html { redirect_to(@good, :notice => 'Goods was successfully created.') }
        format.xml  { render :xml => @good, :status => :created, :location => @good }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @good.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goods/1
  # PUT /goods/1.xml
  def update
    @good = Goods.find(params[:id])

    respond_to do |format|
      if @good.update_attributes(params[:good])
        format.html { redirect_to(@good, :notice => 'Goods was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @good.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.xml
  def destroy
    @good = Goods.find(params[:id])
    @good.destroy

    respond_to do |format|
      format.html { redirect_to(goods_index_url) }
      format.xml  { head :ok }
    end
  end
end
