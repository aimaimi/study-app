require 'rails_helper'

RSpec.describe TimeManagement, type: :model do
  describe '日時保存機能' do
    before do
      @time_management = FactoryBot.build(:time_management)
    end

    it 'dateとtimeとuser_idがあれば保存できること' do
      expect(@time_management).to be_valid
    end

    it 'dateが空では保存できないこと' do
      @time_management.date = nil
      @time_management.valid?
      expect(@time_management.errors.full_messages).to include("日付を入力してください")
    end

    it 'timeが空では保存できないこと' do
      @time_management.time = nil
      @time_management.valid?
      expect(@time_management.errors.full_messages).to include("時間を入力してください")
    end

    it 'dateが過去の日付では保存できないこと' do
      @time_management.date = '2020-08-30'
      @time_management.valid?
      expect(@time_management.errors.full_messages).to include("日付は過去の日付にしないでください")
    end

    it 'timeが数値以外では保存できないこと' do
      @time_management.time = 'aiueo'
      @time_management.valid?
      expect(@time_management.errors.full_messages).to include('時間は数値で入力してください')
    end
  end
end
