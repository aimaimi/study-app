class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :feedback

  with_options presence: true do
    validates :answer
    validates :feedback_id
  end

  validates :feedback_id, numericality: { other_than: 1 }
end
