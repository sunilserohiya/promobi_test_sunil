require 'rails_helper'

describe CoursesController do
  it "create the course" do
    post :create, params: {course: {name: "ROR course", description: "description",  tutors_attributes: [name: "Rakshit Dhingra", experience: 3]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(201)
    expect(parsed_body[:id]).to_not eql nil
    expect(parsed_body[:name]).to eql("ROR course")
  end
  it "should not create the course if name is not present" do
    post :create, params: {course: {tutors_attributes: [name: "Rakshit"]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(422)
    expect(parsed_body[:name]).to eql(["can't be blank"])
  end

  it "should not create the course if description is not present" do
    post :create, params: {course: {name: "ROR course", tutors_attributes: [name: "Rakshit"]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(422)
    expect(parsed_body[:description]).to eql(["can't be blank"])
  end

  it "should list all the courses" do
    get :index
    expect(response.status).to equal(200)
  end
end