class Organization < ApplicationRecord
	validates :organization_name, presence: true

	belongs_to :admin
	has_many :users
end
