require 'test_helper'

class ContactManagersControllerTest < ActionController::TestCase
  setup do
    @contact_manager = contact_managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_manager" do
    assert_difference('ContactManager.count') do
      post :create, contact_manager: { email: @contact_manager.email, first_name: @contact_manager.first_name, last_name: @contact_manager.last_name, mobile: @contact_manager.mobile }
    end

    assert_redirected_to contact_manager_path(assigns(:contact_manager))
  end

  test "should show contact_manager" do
    get :show, id: @contact_manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_manager
    assert_response :success
  end

  test "should update contact_manager" do
    patch :update, id: @contact_manager, contact_manager: { email: @contact_manager.email, first_name: @contact_manager.first_name, last_name: @contact_manager.last_name, mobile: @contact_manager.mobile }
    assert_redirected_to contact_manager_path(assigns(:contact_manager))
  end

  test "should destroy contact_manager" do
    assert_difference('ContactManager.count', -1) do
      delete :destroy, id: @contact_manager
    end

    assert_redirected_to contact_managers_path
  end
end
