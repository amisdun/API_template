class User < ApplicationRecord
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, length: {minimum: 8}
	validates :organization_name, presence:true

	belongs_to :Organization
	has_many :Template
	validates_associated :Organization
	validates_associated :Template
end
