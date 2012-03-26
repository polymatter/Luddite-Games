class ProductsController < ApplicationController
  # GET /products
  def index
    @products = Product.all

	# return index.html.erb
    respond_to { |f| f.html }
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])

	# return show.html.erb
    respond_to { |f| f.html }
  end

  # GET /products/new
  def new
    @product = Product.new

	# return new.html.erb 
    respond_to { |f| f.html }
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /products/1
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /products/1
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to { |f| f.html { redirect_to products_url } }
  end
end
