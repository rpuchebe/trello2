class Task < ActiveRecord::Base
	validates :title, :description, :time, presence: true
	belongs_to :user
	validate :finish_date_cannot_be_in_the_past

	def finish_date_cannot_be_in_the_past
    errors.add(:finish_date, "can't be in the past") if
      !expiration_date.blank? and expiration_date < Date.start_date
  end
end
