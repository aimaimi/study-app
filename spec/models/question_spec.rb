require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '問題作成機能' do
    before do
      @question = FactoryBot.build(:question)
    end

    it 'problem_statementとcorrect_answerとuser_idがあれば作成できること' do
      expect(@question).to be_valid
    end

    it 'problem_statementが空だと作成できないこと' do
      @question.problem_statement = nil
      @question.valid?
      expect(@question.errors.full_messages).to include("Problem statement can't be blank")
    end

    it 'correct_answerが空だと作成できないこと' do
      @question.correct_answer = nil
      @question.valid?
      expect(@question.errors.full_messages).to include("Correct answer can't be blank")
    end
  end
end
