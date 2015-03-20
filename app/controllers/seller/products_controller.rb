class Seller::ProductsController < Seller::BaseController
	before_action :myproduct, only: [:edit, :update, :destroy]
	def index
		@store = Store.find_by_user_id(current_user.id)
		@products = StoreProduct.where(store_id: @store.id)
	end

	def new
		@store = Store.find_by_user_id(current_user.id)
		@sid = @store.id
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

	def edit
		@product = StoreProduct.find(params[:id])
	end

	def update
		@product = StoreProduct.find(params[:id])
		if @product.update(product_params)
			redirect_to seller_products_path
		else
			render :edit
		end
	end

	def destroy
		@product = StoreProduct.find(params[:id])
		@product.destroy

		redirect_to seller_products_path
	end

	private
	def product_params
		params.require(:store_product).permit(:name, :category, :store_id, :origin_price, :price, :size, :image, :content)
	end

	def myproduct
		@store = Store.find_by_user_id(current_user.id)
 
		@product = StoreProduct.find(params[:id])

		if @product.store_id != @store.id
			redirect_to seller_products_path, notice: '您沒有此商品'
		end
	end
end