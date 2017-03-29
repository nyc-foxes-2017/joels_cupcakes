require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) {User.create!(username:"nancy",email:"nancy@email.com", password:"password")}
  describe "GET #index" do
    it "responds with status code 200" do
      get :index, {id: user.id}
      expect(response).to have_http_status 200
    end

    it "renders the :index template" do
      get :index, {id: user.id}
      expect(response).to render_template(:index)
    end

  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, {id: user.id}
      expect(response).to have_http_status 200
    end

    it "renders the :show template" do
      get :show, {id: user.id}
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
        get :new, {id: user.id}
        expect(response).to have_http_status 200
    end

    it "renders the :new template" do
      get :new, {id: user.id}
      expect(response).to render_template(:new)
    end
  end
end
