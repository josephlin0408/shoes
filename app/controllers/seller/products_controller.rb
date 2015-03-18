class Seller::ProductsController < Seller::BaseController
	def index
		@products = StoreProduct.all
	end

	def new
		@product = StoreProduct.new
	end

	def create
		@product = StoreProduct.new(product_params)
		if @product.save
			redirect_to seller_products_path
		else
			render :new
		end
	end

	private
	def product_params
		params.require(:store_product).permit(:name, :store_id, :origin_price, :price, :size, :image, :content)
	end
end