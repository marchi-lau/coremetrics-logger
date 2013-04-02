require 'test_helper'

class TagAttributesControllerTest < ActionController::TestCase
  setup do
    @tag_attribute = tag_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_attribute" do
    assert_difference('TagAttribute.count') do
      post :create, tag_attribute: { key: @tag_attribute.key, name: @tag_attribute.name }
    end

    assert_redirected_to tag_attribute_path(assigns(:tag_attribute))
  end

  test "should show tag_attribute" do
    get :show, id: @tag_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag_attribute
    assert_response :success
  end

  test "should update tag_attribute" do
    put :update, id: @tag_attribute, tag_attribute: { key: @tag_attribute.key, name: @tag_attribute.name }
    assert_redirected_to tag_attribute_path(assigns(:tag_attribute))
  end

  test "should destroy tag_attribute" do
    assert_difference('TagAttribute.count', -1) do
      delete :destroy, id: @tag_attribute
    end

    assert_redirected_to tag_attributes_path
  end
end
