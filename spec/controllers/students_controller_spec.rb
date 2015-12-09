
require "rails_helper"


describe StudentsController do 

describe "GET #index" do
    it "is successful" do
    	teacher = FactoryGirl.create(:teacher)
		sign_in  :teacher, teacher 

      	get :index

      	 expect(response.status).to eq 200
    end
 	 end
  end