class Template < ApplicationRecord
	validates :title, presence: true
	validates :form, presence: true

    belongs_to :Admin
    belongs_to :User
    validates_associated :Admin
    validates_associated :User
end
