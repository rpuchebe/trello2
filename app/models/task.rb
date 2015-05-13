class Task < ActiveRecord::Base
	validates :title, :description, :time, presence: true
	belongs_to :user
end
