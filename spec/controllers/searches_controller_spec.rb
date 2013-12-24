require 'spec_helper'

describe SearchesController do

  before(:each){bypass_authentication}
  after(:each){restore_authentication}

  # This should return the minimal set of attributes required to create a valid
  # Search. As you add validations to Search, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "keywords" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SearchesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all searches as @searches" do
      search = Search.create! valid_attributes
      get :index, {}, valid_session
      assigns(:searches).should eq([search])
    end
  end

  describe "GET show" do
    it "uses the TwitterService to request search results" do
      # search = Search.create! valid_attributes
      expect stub_request(:get, "https://api.twitter.com/1.1/search/tweets.json?q=%23%23MyString").
         with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'OAuth oauth_consumer_key="hIl8qNe1VqxKJuxHhWoA", oauth_nonce="11d050773cc16bc216084088f355b50e", oauth_signature="b0aBoeGVf5FvNuIPamT5j0LUgUs%3D", oauth_signature_method="HMAC-SHA1", oauth_timestamp="1385450864", oauth_token="1944743442-3pV23TQz68mT0GeyoINA6HDwRoe78UvWwLRLWuY", oauth_version="1.0"', 'User-Agent'=>'Twitter Ruby Gem 4.8.1'}).
         to_return(:status => 200, :body => "", :headers => {})
      # get :show, {:id => search.to_param}, valid_session
      # assigns(:search).should eq(search)
    end
  end

  describe "GET new" do
    it "assigns a new search as @search" do
      get :new, {}, valid_session
      assigns(:search).should be_a_new(Search)
    end
  end

  describe "GET edit" do
    it "assigns the requested search as @search" do
      search = Search.create! valid_attributes
      get :edit, {:id => search.to_param}, valid_session
      assigns(:search).should eq(search)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "creates a new Search" do
        VCR.use_cassette 'controllers/search' do
          expect {
            post :create, {:search => valid_attributes}, valid_session
          }.to change(Search, :count).by(1)
        end
      end

      it "assigns a newly created search as @search" do
        VCR.use_cassette 'controllers/search' do
          post :create, {:search => valid_attributes}, valid_session
          assigns(:search).should be_a(Search)
          assigns(:search).should be_persisted
        end
      end

      it "redirects to the created search" do
        VCR.use_cassette 'controllers/search' do
          post :create, {:search => valid_attributes}, valid_session
          response.should redirect_to(Search.last)
        end
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved search as @search" do
        VCR.use_cassette 'controllers/search_invalid' do
          # Trigger the behavior that occurs when invalid params are submitted
          Search.any_instance.stub(:save).and_return(false)
          post :create, {:search => { "keywords" => "invalid value" }}, valid_session
          assigns(:search).should be_a_new(Search)
        end
      end

      it "re-renders the 'new' template" do
        VCR.use_cassette 'controllers/search_invalid' do
          # Trigger the behavior that occurs when invalid params are submitted
          Search.any_instance.stub(:save).and_return(false)
          post :create, {:search => { "keywords" => "invalid value" }}, valid_session
          response.should render_template("new")
        end
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested search" do
        search = Search.create! valid_attributes
        # Assuming there are no other searches in the database, this
        # specifies that the Search created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Search.any_instance.should_receive(:update).with({ "keywords" => "MyString" })
        put :update, {:id => search.to_param, :search => { "keywords" => "MyString" }}, valid_session
      end

      it "assigns the requested search as @search" do
        search = Search.create! valid_attributes
        put :update, {:id => search.to_param, :search => valid_attributes}, valid_session
        assigns(:search).should eq(search)
      end

      it "redirects to the search" do
        search = Search.create! valid_attributes
        put :update, {:id => search.to_param, :search => valid_attributes}, valid_session
        response.should redirect_to(search)
      end
    end

    describe "with invalid params" do
      it "assigns the search as @search" do
        search = Search.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Search.any_instance.stub(:save).and_return(false)
        put :update, {:id => search.to_param, :search => { "keywords" => "invalid value" }}, valid_session
        assigns(:search).should eq(search)
      end

      it "re-renders the 'edit' template" do
        search = Search.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Search.any_instance.stub(:save).and_return(false)
        put :update, {:id => search.to_param, :search => { "keywords" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested search" do
      search = Search.create! valid_attributes
      expect {
        delete :destroy, {:id => search.to_param}, valid_session
      }.to change(Search, :count).by(-1)
    end

    it "redirects to the searches list" do
      search = Search.create! valid_attributes
      delete :destroy, {:id => search.to_param}, valid_session
      response.should redirect_to(searches_url)
    end
  end

end
