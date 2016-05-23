require 'rails_helper'

RSpec.describe Bug, type: :model do
  describe "Bug model" do
    let(:bug){
      FactoryGirl.create(:bug)
    }

    let(:bug_two){
      FactoryGirl.create(:bug)
    }

    it "has a state" do
      expect(bug.state).to be_a State
    end

    it "increment bug number" do
      expect(bug.bug_number).to eq 1
      expect(bug_two.bug_number).to eq 2
    end
  end
end
