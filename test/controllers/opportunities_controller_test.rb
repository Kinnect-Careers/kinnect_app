require 'test_helper'

class OpportunitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opportunity = opportunities(:opp1)
  end

  test "should get index" do
    get opportunities_url
    assert_response :success
  end

  test "should get new" do
    get new_opportunity_url
    assert_response :success
  end

  test "should create opportunity" do
    assert_difference('Opportunity.count') do
      post opportunities_url, 
        params: { 
          opportunity: {
            title: @opportunity.title,
            description: @opportunity.description,
            tasks: @opportunity.tasks,
            requirements: @opportunity.requirements,
            company_id: companies(:company2).id
          }
        }
    end

    assert_redirected_to opportunity_url(Opportunity.last), "Should edirected to last opportunity URL #{Opportunity.last}"
  end

  test "should show opportunity" do
    get opportunity_url(@opportunity)
    assert_response :success
  end

  test "should get edit" do
    get edit_opportunity_url(@opportunity)
    assert_response :success
  end

  test "should update opportunity" do
    patch opportunity_url(@opportunity), params: { opportunity: { company_id: @opportunity.company_id, description: @opportunity.description, requirements: @opportunity.requirements, tasks: @opportunity.tasks, title: @opportunity.title } }
    assert_redirected_to opportunity_url(@opportunity)
  end

  test "should destroy opportunity" do
    assert_difference('Opportunity.count', -1) do
      delete opportunity_url(@opportunity)
    end

    assert_redirected_to opportunities_url
  end
end
