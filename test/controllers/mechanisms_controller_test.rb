require "test_helper"

class MechanismsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mechanism = mechanisms(:one)
  end

  test "should get index" do
    get mechanisms_url
    assert_response :success
  end

  test "should get new" do
    get new_mechanism_url
    assert_response :success
  end

  test "should create mechanism" do
    assert_difference("Mechanism.count") do
      post mechanisms_url, params: { mechanism: { name: @mechanism.name } }
    end

    assert_redirected_to mechanism_url(Mechanism.last)
  end

  test "should show mechanism" do
    get mechanism_url(@mechanism)
    assert_response :success
  end

  test "should get edit" do
    get edit_mechanism_url(@mechanism)
    assert_response :success
  end

  test "should update mechanism" do
    patch mechanism_url(@mechanism), params: { mechanism: { name: @mechanism.name } }
    assert_redirected_to mechanism_url(@mechanism)
  end

  test "should destroy mechanism" do
    assert_difference("Mechanism.count", -1) do
      delete mechanism_url(@mechanism)
    end

    assert_redirected_to mechanisms_url
  end
end
