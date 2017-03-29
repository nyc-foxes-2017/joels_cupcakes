require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    let(:user) = User.new{(username:"nancy",email:"nancy@email.com", password:"password")}

  describe "GET #new" do
    it "gets a form for a new user" do
    end
  end

end
