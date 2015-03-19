class ProductCategory < ActiveRecord::Base
	has_many :store_product_categoryships
	has_many :stores, :through => :store_product_categoryships
end
