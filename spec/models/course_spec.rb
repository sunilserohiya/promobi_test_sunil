require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Validations" do
    
    it "is not valid with new only" do
      expect(Course.new).to_not be_valid
    end
    
    it "is not valid with name" do
      expect(Course.new(name: "Ror course")).to_not be_valid
    end

    it "is not valid with description" do
      expect(Course.new(description: "Ror course")).to_not be_valid
    end

    it "is not valid with name and description" do
      expect(Course.new(name: "Ror course", description: "ROR courses are good")).to be_valid
    end


  end
  describe "Associations" do
    it "has many tutors" do
      assc = Course.reflect_on_association(:tutors)
      expect(assc.macro).to eq :has_many
    end
  end
end