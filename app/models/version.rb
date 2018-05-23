class Version < ApplicationRecord
    #association has been used. Here version is belongs to address
    belongs_to :address
    #validation made below
    validates_presence_of :address_id
    validates_presence_of :address

end
