class Api::V1::SearchesController < ApplicationController
  def index
    searches = Search.all
    render json: searches, status: 200
  end
  
  def create
    search = Search.create(search_params)
    scraper = AudibleScraper.new(searchTerm: search_params[:text])
    books = scraper.scrape_audible_books
    render json: search, include: [:books]
  end

  def destroy
    search = Search.find(params[:id])
    search.delete
    render json: {searchId: search.id}
  end

  # def show
  #   search = Search.find(params[:id])
  #   render json: search, status: 200
  # end

  private 

  def search_params
    params.require(:search).permit(:text)
  end
end
