class Admin < ApplicationRecord
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, length: {minimum: 8}


    has_one :Organization
    has_many :Template
end
