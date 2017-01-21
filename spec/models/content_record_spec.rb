require 'rails_helper'

RSpec.describe ContentRecord, type: :model do
  before :all do
    @web_page = FactoryGirl.create(:web_page)
  end
  
  it 'should have a valid factory' do
    expect(FactoryGirl.create(:content_record, web_page: @web_page)).to be_valid
  end
  
  context 'relationships' do
    it { should belong_to(:web_page) }
  end
  
  context 'validations' do
    context 'relationships' do
      it { should validate_presence_of(:web_page) }
    end
    context 'fields' do
      subject { FactoryGirl.build(:content_record, web_page: @web_page) }
      it { should validate_presence_of(:content) }
      it { should validate_presence_of(:kind) }
      it { should validate_inclusion_of(:kind).in_array(ContentRecord::CONTENT_KINDS) }
    end
  end
end
