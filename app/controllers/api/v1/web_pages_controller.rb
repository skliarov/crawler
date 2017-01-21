class Api::V1::WebPagesController < Api::V1::ApiController
  # GET /api/v1/web_pages
  def index
    # Fetch web pages, limit response to last 50
    # Also it's a good idea to implement pagination for `index` action
    web_pages = WebPage.order(id: :desc).limit(50)
    render json: web_pages, status: :ok
  end
  
  # POST /api/v1/web_pages
  def create
    # Instantiate new WebPage with URL to crawl
    # Actual crawling is done in WebPage model
    # For production projects it's a good idea to perform web page crawl in background by adding `WebPage` records to crawl queue
    web_page = WebPage.new(web_page_params)
    if web_page.save
      render json: web_page, status: :ok
    else
      render json: { errors: web_page.errors.full_messages }, status: :bad_request
    end
  end
  
  private
    def web_page_params
      params.require(:web_page).permit(:url)
    end
end
