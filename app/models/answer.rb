class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :feedback

  validates :answer, :feedback, presence: true

  validates :feedback_id, numericality: { other_than: 1 }
end
