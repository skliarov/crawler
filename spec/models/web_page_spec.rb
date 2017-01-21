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
      it 'should validate format of URL' do
        # Valid URL
        page_with_valid_url = FactoryGirl.build(:web_page, url: 'https://www.appdev.academy/portfolio')
        expect(page_with_valid_url).to be_valid
        
        page_with_invalid_url_1 = FactoryGirl.build(:web_page, url: 'www.appdev.academy/portfolio')
        expect(page_with_invalid_url_1).not_to be_valid
        
        page_with_invalid_url_2 = FactoryGirl.build(:web_page, url: '/portfolio')
        expect(page_with_invalid_url_2).not_to be_valid
      end
    end
  end
end
