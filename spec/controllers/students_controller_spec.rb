
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

describe "POST #create" do
    context "when the attributes are complete" do
      it "redirects to root path" do
      	teacher = FactoryGirl.create(:teacher)
		sign_in  :teacher, teacher 
        post :create, student: { first_name: "Juan", last_name: "Vazquez", birthdate: "1999/07/30", control_number: "11460309", semester: "9" }

        expect(response).to redirect_to(root_path)
      end
    end

     context "when the attributes are incomplete" do
      it "renders the new template" do
      	teacher = FactoryGirl.create(:teacher)
		sign_in  :teacher, teacher 
        post :create, student: { first_name: nil, last_name: nil, birthdate: nil, control_number: nil, semester: nil }

        expect(response).to render_template("new")
      end

      it "is unprocessable entity" do
      	teacher = FactoryGirl.create(:teacher)
		sign_in  :teacher, teacher 
        post :create, student: { first_name: nil, last_name: nil, birthdate: nil, control_number: nil, semester: nil }
        expect(response.status).to eq 422
      end
    end
end
 describe "GET #edit" do
    it "is successful" do
    	teacher = FactoryGirl.create(:teacher)
		sign_in  :teacher, teacher 
    	
      p = Student.create!( first_name: "Giovani", last_name: "Santiago", birthdate: "1993/01/30", control_number: "11460305", semester: "9" )

      get :edit, id: p.id

      expect(response.status).to eq 200
    end
    it "is not found" do
    	teacher = FactoryGirl.create(:teacher)
		sign_in  :teacher, teacher 
      get :edit, id: 1

      expect(response.status).to eq 404
    end
  end
  
  describe "PUT #update" do
    it "redirects to root path" do
    	teacher = FactoryGirl.create(:teacher)
		sign_in  :teacher, teacher 
        p = Student.create!( first_name: "Giovani", last_name: "Santiago", birthdate: "1993/01/30", control_number: "11460305", semester: "9" )

      put :update, id: p.id, student: { first_name: "Giovani2" }

      expect(response).to redirect_to(root_path)
    end

    context "when the attributes are invalid" do
      it "renders the edit view" do
      	teacher = FactoryGirl.create(:teacher)
		sign_in  :teacher, teacher 
        p = Student.create!( first_name: "Giovani", last_name: "Santiago", birthdate: "1993/01/30", control_number: "11460305", semester: "9" )

        put :update, id: p.id, student: { first_name: nil }
 		expect(response).to render_template("edit")
      end

      it "renders the edit view" do
	      	teacher = FactoryGirl.create(:teacher)
			sign_in  :teacher, teacher 
	        p = Student.create!( first_name: "Giovani", last_name: "Santiago", birthdate: "1993/01/30", control_number: "11460305", semester: "9" )

	        put :update, id: p.id, student: { first_name: nil }

	        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to root path" do
    	teacher = FactoryGirl.create(:teacher)
		sign_in  :teacher, teacher 
      p = Student.create!( first_name: "Giovani", last_name: "Santiago", birthdate: "1993/01/30", control_number: "11460305", semester: "9" )

      delete :destroy, id: p.id

      expect(response).to redirect_to(root_path)
    end

    it "redirects returns an exception" do
    	teacher = FactoryGirl.create(:teacher)
		sign_in  :teacher, teacher 
      delete :destroy, id: 1

      expect(response.status).to eq 404
    end
  end

  end #end StudentsController