class AddressController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		# Parse the input
		@addresses = Address.all
		# Get data from input
		response = @addresses.map{|address| {id: address.address_id, company: address.company, address: address.address, current_version: address.current_version_id, created_at: address.created_at, updated_at: address.updated_at} }

		# Present the output in some format
		respond_to do |format|
			format.json  { render :json => response } # don't do msg.to_json
		end
	end

	def show
		@add = params[:id]
		@addres = Address.find(@add)
		respond_to do |format|
			format.json {render :json => @addres}
		end
	end

	# def new
	# 	@add = 	Version.new
	# end

	def create
		@add1 = Address.new(address_params)
		if @add1.save
			puts "ID = #{@add1.address_id}"
			# Return HTTP 200 along with object primary key
			response = {id: @add1.id}
			# render response
		else
			puts "Save failed"
			# Return HTTP 400
			response = {error: "Save failed" }
			# render response
		end
	end

	def destroy
		@add = params[:id]
		Address.find(@add).destroy
		#redirect_to :action =>'index'
	end

	def update
	 		@add = params[:id] 
			@addres = Address.find(@add) 
		if @addres.update_attributes(address_params)
			
		else

		end
		respond_to do |format|
			format.json {render :json => @addres}
		end
	end
	


	def address_params
      params.permit(:company, :address, :created_at, :updated_at)
	end


	
end