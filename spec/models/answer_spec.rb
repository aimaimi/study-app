require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe '解答保存機能' do
    before do
      @answer = FactoryBot.build(:answer)
    end

    it 'answerとfeedback_idとuser_idとquestion_idがあれば保存できること' do
      expect(@answer).to be_valid
    end

    it 'answerが空では保存できないこと' do
      @answer.answer = nil
      @answer.valid?
      expect(@answer.errors.full_messages).to include('解答を入力してください')
    end

    it 'feedback_idが1では保存できないこと' do
      @answer.feedback_id = 1
      @answer.valid?
      expect(@answer.errors.full_messages).to include('問題の手応えを選択してください')
    end
  end
end
