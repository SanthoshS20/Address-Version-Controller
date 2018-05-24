class AddressController < ApplicationController
	#callbacks used here to verify authentication
	skip_before_action :verify_authenticity_token
	def index
		# all the addresses table values to passed to the instance variable
		@addresses = Address.all
		# creating the procedure to show the output process in which sequence way
		response = @addresses.map{|address| {id: address.address_id, company: address.company, address: address.address, current_version: address.current_version_id, created_at: address.created_at, updated_at: address.updated_at} }

		# Present the output in some format
		# output in the json format using respond_to
		respond_to do |format|
			format.json  { render :json => response } # don't do msg.to_json
		end
	end
	
	def show
		# getting the id value from postman 
		@add = params[:id]
		# passing the particular tuple values to the instance variable @addres
		@addres = Address.find(@add)
		# producing the output as json in the postman
		respond_to do |format|
			format.json {render :json => @addres}
		end
	end

	# def new
	# 	@add = 	Version.new
	# end

	def create
		@add1 = Address.new(address_params)
		@add1.created_at = Time.now()
		@add1.updated_at = "null"
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
		# to destroy a particular id
		@add = params[:id]
		Address.find(@add).destroy
		#redirect_to :action =>'index'
	end

	def update
		# to update a particular id 
	 		@add = params[:id] 
			@addres = Address.find(@add) 
		if @addres.update_attributes(address_params)
			
		else

		end
		respond_to do |format|
			format.json {render :json => @addres}
		end
	end
	

	# parameters has been used
	def address_params
      params.permit(:company, :address)
	end


	
end
