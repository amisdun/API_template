class User < ApplicationRecord
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true
	validates :organization_name, presence:true

	belongs_to :organization
	has_many :templates
end
