class Seller::ProductCategoriesController < Seller::BaseController
	def index
		@product_categories = ProductCategory.all
	end

	def new
		@store = Store.find_by_user_id(current_user.id)
		@sid = @store.id
		@product_category = ProductCategory.new
	end

	def create
		@store = Store.find_by_user_id(current_user.id)
		@product_category = @store.product_categories.create(product_categories_params)
		if @product_category.save
			redirect_to seller_product_categories_path
		else
			render :new
		end
	end

	private
	def product_categories_params
		params.require(:product_category).permit(:name, :store_id)
	end
end
