class Seller::ProductCategoriesController < Seller::BaseController
	before_action :mystorecategory, only: [:edit, :update]
	def index
		@store = Store.find_by_user_id(current_user.id)
		@product_categories = ProductCategory.where(store_id: @store.id)
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

	def edit
		@product_category = ProductCategory.find(params[:id])
		@store = Store.find_by_user_id(current_user.id)
		@sid = @store.id
	end

	def update
		@product_category = ProductCategory.find(params[:id])
		if @product_category.update(product_categories_params)
			redirect_to seller_product_categories_path
		else
			render :edit
		end
	end

	def destroy
		@product_category = ProductCategory.find(params[:id])
		@product_category.destroy

		redirect_to seller_product_categories_path
	end

	private
	def product_categories_params
		params.require(:product_category).permit(:name, :store_id)
	end

	def mystorecategory
		@store = Store.find_by_user_id(current_user.id)
 
		@productcategory = ProductCategory.find(params[:id])

		if @productcategory.store_id != @store.id
			redirect_to seller_products_path, notice: '您沒有這個分類'
		end
	end
end
