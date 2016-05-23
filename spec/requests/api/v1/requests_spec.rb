require 'rails_helper'

describe "Bugs API" do
  let(:bug) {
    FactoryGirl.create(:bug)
  }

  let(:new_data) { {bug: {app_token: "fff222aaa00", bug_priority: "minor", bug_status: "new_bug"}, state: {device: "iphone", os: "mac", memory: 2313, storage: 1111}} }
  let(:invalid_data) { {bug: {bug_priority: "minor", bug_status: "new_bug"} }}

  it "returns status code 200" do
    get "/api/v1/bugs/count/#{bug.app_token}"
    expect(response).to be_success
  end

  it "returns count number" do
    get "/api/v1/bugs/count/#{bug.app_token}"
    total_number = JSON.parse(response.body)["total_number"]
    expect(total_number).to be_a Integer
  end

  it "returns a bug" do
    get "/api/v1/bugs/#{bug.app_token}/#{bug.bug_number}"
    response_bug = JSON.parse(response.body)["bug"]
    expect(response_bug["app_token"]).to eq bug.app_token
    expect(response_bug["bug_number"]).to eq bug.bug_number
  end

  it "posts a new bug and state" do

    post "/api/v1/bugs", new_data.to_json, {'ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json'}
    post_response = JSON.parse(response.body)
    expect(response.response_code).to eq 200
    expect(post_response["number"]).to eq 1

    post "/api/v1/bugs", new_data.to_json, {'ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json'}
    post_response = JSON.parse(response.body)
    expect(response.response_code).to eq 200
    expect(post_response["number"]).to eq 2
  end

  it "catches invalid data" do
    post "/api/v1/bugs", invalid_data.to_json, {'ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json'}
    post_response = JSON.parse(response.body)
    expect(response.response_code).to eq 400
    #checks for blank app_token error
    expect(post_response["error"]).to include("app_token")
    expect(post_response["error"]).to include("state")
  end
end