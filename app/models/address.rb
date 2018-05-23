class Address < ApplicationRecord
	has_many :versions
	validates_presence_of :company
	after_validation do |address|
		puts "Validation over"
	end
	before_update :add_data, on: [:update]

	private 
		def add_data
			@versions =Version.new
			@versions.address_id = self.id_was
			@versions.ver_address = self.address_was
			@versions.created_at = self.created_at_was
			@versions.updated_at = self.updated_at_was
			@versions.save
		end

	before_update :add_data_more, on: [:update]

	private
	def add_data_more
		self.current_version_id = @versions.id
	end
end
