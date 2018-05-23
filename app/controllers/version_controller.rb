class VersionController < ApplicationController
	skip_before_action :verify_authenticity_token
    def index
		# Parse the input
		@versions = Version.all

		# Get data from input

		# Present the output in some format
		respond_to do |format|
			format.json  { render :json => @versions } # don't do msg.to_json
		end
	end

	def show
		@ver = Version.find('1')
		respond_to do |format|
			format.json  { render :json => @ver } # don't do msg.to_json
		end
	end

	#def new
	#	@add = 	Address.new
	#end

    def create(addres)
		@addres = Version.new(version_param)
		response = {}
		if @addres.save
			puts "ID = #{@addres.id}"
			# Return HTTP 200 along with object primary key
			#response = {id: @add.id}
			#render response
		else
			puts "Save failed"
			#Return HTTP 400
			#response = {error: "Save failed" }
			#render response ={}
		end
	end

	def delete
		Version.find('2').destroy
		#redirect_to :action =>'index' 
	end

	def edit
		@ver=Version.find('1')
	end

	def update
		@ver=Version.find('1')
		if @ver.update_attributes(version_param)
			#redirect_to :action =>'show'
		else
			#render :action =>'edit'
		end
				
	end

	def version_param
      params.permit(:address_id, :ver_address)
	end
end
