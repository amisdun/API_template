class User < ApplicationRecord
	validates :username, presence: true
	validates :password, presence: true
	validates_presence_of :organization_id

	belongs_to :organization
	has_many :templates
end
