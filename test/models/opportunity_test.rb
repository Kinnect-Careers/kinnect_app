require 'test_helper'

class OpportunityTest < ActiveSupport::TestCase
  setup do
    @opportunity = opportunities(:opp1)
  end
  
  test "Opportunity does not have blank fields" do
    assert_not @opportunity.title.blank?
    assert_not @opportunity.requirements.blank?
    assert_not @opportunity.description.blank?
    assert_not @opportunity.tasks.blank?
    assert_not @opportunity.company.blank?
  end
  
  test "opportunity should be valid" do
    assert @opportunity.valid?, "Opportunity should be valid #{@opportunity.errors.inspect}"
  end
  
  
end
