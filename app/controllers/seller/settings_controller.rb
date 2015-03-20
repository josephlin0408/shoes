class Seller::SettingsController < Seller::BaseController
	before_action :mystore, only: [:edit, :update]

	def index
		@settings = Store.where(user_id: current_user.id)
	end

	def edit
		@setting = Store.find(params[:id])
	end

	def update
		@setting = Store.find(params[:id])
		if @setting.update(setting_params)
			redirect_to seller_settings_path
		else
			render :edit
		end
	end

	private
	def setting_params
		params.require(:store).permit(:name, :tel, :address, :zip)
	end

	def mystore
		@current_store = Store.find_by_user_id(current_user.id)

		@store = Store.find(params[:id])

		if @current_store.id != @store.id
			redirect_to seller_settings_path, notice: '找不到該店家'
		end
	end
end
