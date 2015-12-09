require "rails_helper"

describe Student do
describe "#name" do
		it "regresar nombre y a pellido" do
			student=Student.create!( 
			first_name: "Giovani",
			last_name: "Santiago",
			birthdate: "30/01/1993",
		    control_number:"11460305",
		    semester: "9" )
		    expect(student.name).to eq "Giovani Santiago"
	end
	end
end