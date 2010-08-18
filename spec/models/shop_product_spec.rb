require File.dirname(__FILE__) + '/../spec_helper'

describe ShopProduct do
  dataset :shop_products
  
  before(:each) do
    @product = shop_products(:soft_bread)
    @products = [
      shop_products(:soft_bread),
      shop_products(:crusty_bread),
      shop_products(:warm_bread)
    ]
  end
  
  context 'attributes' do
    
    it 'should have a title' do
      @product.title.should == 'soft bread'
    end
    
    it 'should have an sku' do
      @product.sku.should == 'soft_bread'
    end
    
    it 'should have the same handle as its sku' do
      @product.sku.should == @product.handle
    end
    
    it 'should have a position' do
      @product.position.should == 1
    end
    
    it 'should have a price' do
      @product.price.should === 10.00
    end
    
    it 'should have a category' do
      @product.category.class.should == ShopCategory
    end
    
  end
  
  context 'validation' do
    
    it 'should require a title and category' do
      @product = ShopProduct.new()
      @product.valid? == false
      
      @product.title = "title"
      @product.valid? == false
      @product.title = nil
      
      @product.category = shop_categories(:bread)
      @product.valid? == false

      @product.title = "title"
      @product.valid? == true
    end
    
    it 'should validate but not require the price' do
      @product = ShopProduct.new({ :title => 'bread', :category => shop_categories(:bread) })
      @product.valid? == true
      
      @product.price = "asdas"
      @product.valid? == false
      
      @product.price = "-999.99"
      @product.valid? == false
      
      @product.price = "9.99.99"
      @product.valid? == false
      
      @product.price = "0.00"
      @product.valid? == false
      
      @product.price = "0.01"
      @product.valid? == true
      
      @product.price = "999999.99"
      @product.valid? == true
    end
    
    it 'should generate a valid sku on validation' do
      @product = ShopProduct.new({ :title => 'dark_ _:_;_=_+_._~_toasted', :category => shop_categories(:bread) })
      @product.valid? == true
      @product.sku.should == 'dark_-_-_-_-_-_-_-_toasted'
    end
    
    it 'should have an array of images' do
      @product.product_images.class.should == Array
      @product.images.class.should == Array
      @product.images.length.should == 3
      @product.images.length.should == @product.product_images.length
    end
    
  end
  
end