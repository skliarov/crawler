require 'rails_helper'

RSpec.describe Api::V1::WebPagesController, type: :controller do
  describe 'GET #index' do
    before :each do
      get :index
    end
    
    it 'should have successful response status' do
      expect(response.status).to eq(200)
    end
    
    it 'should have valid content-type' do
      expect(response.content_type).to eq('application/json')
    end
  end
  
  describe 'POST #create' do
    context 'with valid params' do
      context 'without content crawling' do
        before :each do
          web_page_params = FactoryGirl.attributes_for(:web_page)
          post :create, params: { web_page: web_page_params }
          @web_page = WebPage.find_by(web_page_params)
        end
        
        it 'should have successful response status' do
          expect(response.status).to eq(200)
        end
        
        it 'should have valid content-type' do
          expect(response.content_type).to eq('application/json')
        end
        
        it 'should create new WebPage' do
          expect(@web_page).not_to eq(nil)
        end
      end
      
      # Tests in this context should crawl data from actual URLs (pages should be static and content on them should NOT update)
      context 'with content crawling' do
        context 'URL https://www.appdev.academy' do
          before :each do
            url = 'https://www.appdev.academy'
            post :create, params: { web_page: { url: url }}
            @web_page = WebPage.find_by(url: url)
          end
          
          it 'should have successful response status' do
            expect(response.status).to eq(200)
          end
          
          it 'should have valid content-type' do
            expect(response.content_type).to eq('application/json')
          end
          
          it 'should create new WebPage' do
            expect(@web_page).not_to eq(nil)
          end
          
          it 'should have correct number of h1 tags' do
            count = @web_page.content_records.where(kind: 'h1').count
            expect(count).to eq(0)
          end
          
          it 'should have correct number of h2 tags' do
            count = @web_page.content_records.where(kind: 'h2').count
            expect(count).to eq(1)
          end
          
          it 'should have correct number of h3 tags' do
            count = @web_page.content_records.where(kind: 'h3').count
            expect(count).to eq(0)
          end
          
          it 'should have correct number of a tags' do
            count = @web_page.content_records.where(kind: 'a').count
            expect(count).to eq(15)
          end
        end
        
        context 'URL https://www.appdev.academy/open-source' do
          before :each do
            url = 'https://www.appdev.academy/open-source'
            post :create, params: { web_page: { url: url }}
            @web_page = WebPage.find_by(url: url)
          end
          
          it 'should have successful response status' do
            expect(response.status).to eq(200)
          end
          
          it 'should have valid content-type' do
            expect(response.content_type).to eq('application/json')
          end
          
          it 'should create new WebPage' do
            expect(@web_page).not_to eq(nil)
          end
          
          it 'should have correct number of h1 tags' do
            count = @web_page.content_records.where(kind: 'h1').count
            expect(count).to eq(0)
          end
          
          it 'should have correct number of h2 tags' do
            count = @web_page.content_records.where(kind: 'h2').count
            expect(count).to eq(1)
          end
          
          it 'should have correct number of h3 tags' do
            count = @web_page.content_records.where(kind: 'h3').count
            expect(count).to eq(0)
          end
          
          it 'should have correct number of a tags' do
            count = @web_page.content_records.where(kind: 'a').count
            expect(count).to eq(21)
          end
        end
        
        context 'URL https://www.appdev.academy/articles/21-end-of-year-new-blog' do
          before :each do
            url = 'https://www.appdev.academy/articles/21-end-of-year-new-blog'
            post :create, params: { web_page: { url: url }}
            @web_page = WebPage.find_by(url: url)
          end
          
          it 'should have successful response status' do
            expect(response.status).to eq(200)
          end
          
          it 'should have valid content-type' do
            expect(response.content_type).to eq('application/json')
          end
          
          it 'should create new WebPage' do
            expect(@web_page).not_to eq(nil)
          end
          
          it 'should have correct number of h1 tags' do
            count = @web_page.content_records.where(kind: 'h1').count
            expect(count).to eq(0)
          end
          
          it 'should have correct number of h2 tags' do
            count = @web_page.content_records.where(kind: 'h2').count
            expect(count).to eq(1)
          end
          
          it 'should have correct number of h3 tags' do
            count = @web_page.content_records.where(kind: 'h3').count
            expect(count).to eq(1)
          end
          
          it 'should have correct number of a tags' do
            count = @web_page.content_records.where(kind: 'a').count
            expect(count).to eq(25)
          end
        end
      end
    end
    
    context 'with invalid params' do
      before :each do
        url = '/relative/path/to/local/page'
        post :create, params: { web_page: { url: url }}
        @web_page = WebPage.find_by(url: url)
      end
      
      it 'should have bad request (400) response status' do
        expect(response.status).to eq(400)
      end
      
      it 'should have valid content-type' do
        expect(response.content_type).to eq('application/json')
      end
      
      it 'should NOT create new WebPage' do
        expect(@web_page).to eq(nil)
      end
    end
  end
end
