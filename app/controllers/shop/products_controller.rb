class Shop::ProductsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  no_login_required
  radiant_layout Radiant::Config['shop.product_layout']

  before_filter(:only => :index) { |c| c.include_stylesheet 'admin/extensions/shop/products/products' }
  before_filter(:only => :index) { |c| c.include_javascript 'admin/pagefactory' }

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render :template => 'site/not_found', :status => 404
  end
  
  # GET /shop/search/:query
  # GET /shop/search/:query.js
  # GET /shop/search/:query.xml
  # GET /shop/search/:query.json                                  AJAX and HTML
  #----------------------------------------------------------------------------
  def index
    @shop_products = ShopProduct.search(params[:query])
    @radiant_layout = Radiant::Config['shop.category_layout']

    respond_to do |format|
      format.html { render }
      format.js { render :partial => '/shop/products/products', :collection => @shop_products }
      format.xml { render :xml => @shop_products.to_xml(attr_hash) }
      format.json { render :json => @shop_products.to_json(attr_hash) }
    end
  end
  
  # GET /shop/:category_handle/:handle
  # GET /shop/:category_handle/:handle.js
  # GET /shop/:category_handle/:handle.xml
  # GET /shop/:category_handle/:handle.json                       AJAX and HTML
  #----------------------------------------------------------------------------
  def show
    @shop_product = ShopProduct.find_by_handle(params[:handle])
    @shop_category = @shop_product.category unless @shop_product.nil?
    
    @title = @shop_product.name
    @radiant_layout = @shop_product.layout
    
    respond_to do |format|
      format.html { render }
      format.js { render :partial => '/shop/products/product', :locals => { :product => @shop_product } }
      format.xml { render :xml => @shop_product.to_xml(attr_hash) }
      format.json { render :json => @shop_product.to_json(attr_hash) }
    end
  end
  
end