class StoresController < ApplicationController
	def index
		@stores = Store.all
	end

	def show
		@stores = Store.where(id: params[:id])
		@product_categories = ProductCategory.where(store_id: params[:id])
		@products = StoreProduct.where(store_id: params[:id])
	end

	private
	def store_params
		params.require(:store).permit(:name, :tel, :address, :zip, :image)
	end
end
