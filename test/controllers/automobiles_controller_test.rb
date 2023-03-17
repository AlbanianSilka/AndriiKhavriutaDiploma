require "test_helper"

class AutomobilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @automobile = automobiles(:one)
  end

  test "should get index" do
    get automobiles_url
    assert_response :success
  end

  test "should get new" do
    get new_automobile_url
    assert_response :success
  end

  test "should create automobile" do
    assert_difference("Automobile.count") do
      post automobiles_url, params: { automobile: { horse_power: @automobile.horse_power, name: @automobile.name, price: @automobile.price } }
    end

    assert_redirected_to automobile_url(Automobile.last)
  end

  test "should show automobile" do
    get automobile_url(@automobile)
    assert_response :success
  end

  test "should get edit" do
    get edit_automobile_url(@automobile)
    assert_response :success
  end

  test "should update automobile" do
    patch automobile_url(@automobile), params: { automobile: { horse_power: @automobile.horse_power, name: @automobile.name, price: @automobile.price } }
    assert_redirected_to automobile_url(@automobile)
  end

  test "should destroy automobile" do
    assert_difference("Automobile.count", -1) do
      delete automobile_url(@automobile)
    end

    assert_redirected_to automobiles_url
  end
end
