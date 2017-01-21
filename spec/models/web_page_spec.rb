require 'rails_helper'

RSpec.describe WebPage, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.create(:web_page)).to be_valid
  end
  
  context 'relationships' do
    it { should have_many(:content_records).dependent(:destroy) }
  end
  
  context 'validations' do
    context 'relationships' do
    end
    context 'fields' do
      subject { FactoryGirl.build(:web_page) }
      it { should validate_presence_of(:url) }
    end
  end
end
