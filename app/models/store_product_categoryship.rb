class StoreProductCategoryship < ActiveRecord::Base
	belongs_to :store
	belongs_to :product_category, dependent: :destroy
end
