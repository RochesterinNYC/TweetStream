class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  def index                                     # GET /searches /searches.json
    @searches = Search.all
  end

  def show
    @twitter_service = TwitterService.new     # GET /searches/1 /searches/1.json
    term = @search.keywords
    # @tweets = @twitter_service.search("#{@search.keywords}")
    @tweets = @search.tweets
    @tweet_analyzer = TweetAnalyzer.new(term, @tweets)
    @approval_matrix = ApprovalMatrix.new(term, @tweet_analyzer)
    # @search.x_score = @approval_matrix.despicable_or_brilliant
    # @search.y_score = @approval_matrix.lowbrow_or_highbrow
    # @search.save!
    # @searches = Search.all
  end

  def new                                       # GET /searches/new
    @search = Search.new
  end

  def edit                                      # GET /searches/1/edit
  end

  def create                                    # POST /searches /searches.json
    @search = Search.new(search_params)
    respond_to do |format|
      if @search.save
        term = @search.keywords
        @tweets = SearchEngine.for_term(term)
        Tweet.save_tweets(@tweets, current_user.id, @search.id)
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render action: 'show', status: :created, location: @search }
      else
        format.html { render action: 'new' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def update                                    # PATCH/PUT /searches/1 /searches/1.json
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy                                  # DELETE /searches/1 /searches/1.json
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:keywords, :latitude, :longitude, :radius, :results_summary)
    end
end
