class Store < ActiveRecord::Base
	has_many :product_categories, dependent: :destroy, :through => :store_product_categoryships
	has_many :store_product_categoryships
	mount_uploader :image, ImageUploader
end
