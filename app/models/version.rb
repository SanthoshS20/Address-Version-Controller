class Version < ApplicationRecord
    belongs_to :address
    validates_presence_of :address_id
    validates_presence_of :address

end
