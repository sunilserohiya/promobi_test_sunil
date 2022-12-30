require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe "Validations" do
    
    it "is not valid with new only" do
      expect(Tutor.new).to_not be_valid
    end
    
    it "is not valid with name only" do
      expect(Tutor.new(name: "Rakshit Dhingra")).to_not be_valid
    end

    it "is not valid with experience only" do
      expect(Tutor.new(experience: 3)).to_not be_valid
    end

    it "is valid with name and experience only" do
      course = Course.create(name: "course1", description: "course1 description")
      expect(Tutor.new(name: "tutor2", experience: 3, course_id: course.id)).to be_valid
    end



  end
  describe "Associations" do
    it "belongs to course" do
      assc = Tutor.reflect_on_association(:course)
      expect(assc.macro).to eq :belongs_to
    end
  end
end