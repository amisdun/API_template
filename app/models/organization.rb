class Organization < ApplicationRecord
	validates :organization_name, presence: true

	has_many :User
	belongs_to :Admin
end
