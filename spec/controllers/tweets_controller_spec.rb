require 'rails_helper'

describe TweetsController, type: :controller do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested tweet to @tweet" do
      tweet = create(:tweet)
      get :edit, params: {id: tweet}
      expect(assigns(:tweet)).to eq tweet
    end

    it "renders the :edit templete" do
      get :edit
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of tweets orderd by created_at_DESC" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{|a,b| b.created_at <=> a.created_at})
    end

    it "renders the :index templete" do
      get :index
      expect(response).to render_template :index
    end
  end
end
