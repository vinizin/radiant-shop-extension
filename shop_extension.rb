class ShopExtension < Radiant::Extension
  version "0.9"
  description "Core extension for the Radiant shop"
  url "http://github.com/squaretalent/radiant-shop-extension"
  
  extension_config do |config|
    config.gem 'activemerchant', :lib => 'active_merchant'
  end
  
  UserActionObserver.instance.send :add_observer!, ShopCategory
  UserActionObserver.instance.send :add_observer!, ShopDiscount
  UserActionObserver.instance.send :add_observer!, ShopOrder
  UserActionObserver.instance.send :add_observer!, ShopPackage
  UserActionObserver.instance.send :add_observer!, ShopProduct
  UserActionObserver.instance.send :add_observer!, ShopProductAttachment
  UserActionObserver.instance.send :add_observer!, ShopDiscountable
  UserActionObserver.instance.send :add_observer!, ShopProductVariant
  UserActionObserver.instance.send :add_observer!, ShopVariant
  
  def activate    
    # View Hooks
    unless defined? admin.products
      Radiant::AdminUI.send :include, Shop::Interface::Categories, Shop::Interface::Customers, Shop::Interface::Discounts, Shop::Interface::Orders, Shop::Interface::Packages, Shop::Interface::Products, Shop::Interface::Variants
      
      admin.categories = Radiant::AdminUI.load_default_shop_categories_regions
      admin.customers  = Radiant::AdminUI.load_default_shop_customers_regions
      admin.discounts  = Radiant::AdminUI.load_default_shop_discounts_regions
      admin.orders     = Radiant::AdminUI.load_default_shop_orders_regions
      admin.packages   = Radiant::AdminUI.load_default_shop_packages_regions      
      admin.products   = Radiant::AdminUI.load_default_shop_products_regions
      admin.variants   = Radiant::AdminUI.load_default_shop_variants_regions
    end
    
    # Tags
    Page.send :include, Shop::Tags::Core, Shop::Tags::Address, Shop::Tags::Card, Shop::Tags::Cart, Shop::Tags::Category, Shop::Tags::Item, Shop::Tags::Package, Shop::Tags::Product, Shop::Tags::ProductVariant, Shop::Tags::Responses, Shop::Tags::Tax
    
    # Model Includes
    Page.send :include,  Shop::Models::Page
    Image.send :include, Shop::Models::Image
    User.send :include,  Shop::Models::User
    
    # Controller Includes
    ApplicationController.send :include, Shop::Controllers::ApplicationController
    SiteController.send :include, Shop::Controllers::SiteController
    
    # Tabs3
    
    tab "Shop" do
      add_item "Products",      "/admin/shop"
      add_item "Packages",      "/admin/shop/packages"
      add_item "Orders",        "/admin/shop/orders"
      add_item "Discounts",     "/admin/shop/discounts"
      add_item "Customers",     "/admin/shop/customers"
    end
    
    Radiant::Config['shop.root_page_id']    ||= (Page.first(:conditions => { :slug => 'shop'}).id rescue (Page.first.id rescue nil))
    Radiant::Config['shop.root_page_slug']  ||= 'shop'
    
    Radiant::Config['shop.layout_product']  ||= 'Product'
    Radiant::Config['shop.layout_category'] ||= 'Products'
    
    Radiant::Config['shop.price_unit']      ||= '$'
    Radiant::Config['shop.price_precision'] ||= 2
    Radiant::Config['shop.price_separator'] ||= '.'
    Radiant::Config['shop.price_delimiter'] ||= ','
    
    Radiant::Config['shop.tax_strategy']    ||= 'inclusive' #exclusive
    Radiant::Config['shop.tax_percentage']  ||= '10'
    Radiant::Config['shop.tax_name']        ||= 'gst'
    
    # Scoped Customer Welcome Page
    Radiant::Config['scoped.customer.redirect'] = '/cart'
  end
  
end
