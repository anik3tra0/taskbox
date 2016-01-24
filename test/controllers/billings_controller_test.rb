require 'test_helper'

class BillingsControllerTest < ActionController::TestCase
  setup do
    @billing = billings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:billings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create billing" do
    assert_difference('Billing.count') do
      post :create, billing: { client_id: @billing.client_id, project_id: @billing.project_id, total_amount: @billing.total_amount }
    end

    assert_redirected_to billing_path(assigns(:billing))
  end

  test "should show billing" do
    get :show, id: @billing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @billing
    assert_response :success
  end

  test "should update billing" do
    patch :update, id: @billing, billing: { client_id: @billing.client_id, project_id: @billing.project_id, total_amount: @billing.total_amount }
    assert_redirected_to billing_path(assigns(:billing))
  end

  test "should destroy billing" do
    assert_difference('Billing.count', -1) do
      delete :destroy, id: @billing
    end

    assert_redirected_to billings_path
  end
end
