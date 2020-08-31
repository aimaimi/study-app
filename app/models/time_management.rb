class TimeManagement < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :date
    validates :time
  end

  validate :date_cannot_be_in_the_past
  validates :time, numericality: { only_integer: true }

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date.present? && date < Date.today
  end
end
