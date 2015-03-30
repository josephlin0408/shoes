module StoresHelper
	def count_product(id)
		@count = StoreProduct.where(store_id: id).count		
	end
end
