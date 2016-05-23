require 'rails_helper'

RSpec.describe State, type: :model do
  describe "State model" do
    let(:state) {
      FactoryGirl.create(:state)
    }

    it "Belongs to a bug" do
      expect(state.bug).to be_a Bug
    end
  end
end
