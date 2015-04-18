require 'rails_helper'

# RSpec.describe PeopleController, type: :controller do

  # let(:valid_attributes) {
  #   { first_name: 'Jane', last_name: 'Doe' }
  # }

  # let(:invalid_attributes) {
  #   { first_name: nil, last_name: nil }
  # }

  # let(:valid_session) { {} }

  # describe "GET #index" do
  #   it "assigns all people as @people" do
  #     person = Person.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:people)).to eq([person])
  #   end
  # end

  describe "GET root_path" do
    it "displays Hello World" do
      visit '/'
      expect(page).to have_content("Hello World")
    end
  end

# end