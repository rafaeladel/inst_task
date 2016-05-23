FactoryGirl.define do
  factory :bug do
    app_token "b0d4d17fd9"
    bug_status :new_bug
    bug_priority :minor

    before(:create) do |bug, evaluator|
      bug.state = FactoryGirl.build(:state, bug: bug)
    end
  end
end