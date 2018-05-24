class Address < ApplicationRecord
	#association has been used because address can have many versions
	has_many :versions
	#validate the company name
	validates_presence_of :company
	#callbacks has been used
	after_validation do |address|
		puts "Validation over"
	end
	
	#before updating the database "addresses" i am adding the previous data in the versions table
	before_update :add_data, on: [:update, :rollback]
	private 
		def add_data
			#creating new versions tuple with empty values
			@versions =Version.new
			#passing the values from addresses table to the versions table
			@versions.address_id = self.id_was
			@versions.ver_address = self.address_was
			@versions.created_at = self.created_at_was
			@versions.updated_at = self.updated_at_was
			#the below line is to save the above changes to the verions table
			@versions.save
		end

	before_update :add_data_more, on: [:update]

	private
	def add_data_more
		#add the versions id to the addresses table for the clients want to change the current add. to previous add.
		# add.  means address
		self.current_version_id = @versions.id
	end
end
