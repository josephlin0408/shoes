class Seller::BaseController < ApplicationController
	before_action :login_required, :required_seller!

	layout 'seller.html.erb'

	protected

	#判斷如果身分不是seller就無法進入賣家後台
	def required_seller!
		redirect_to stores_path, notice: '你沒有權限進入此頁面' unless current_user && current_user.seller?
	end
end
