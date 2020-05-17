class Template < ApplicationRecord
	validates :title, presence: true
	validates :form, presence: true

    belongs_to :admin
    belongs_to :user
end
