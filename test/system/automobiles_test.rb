require "application_system_test_case"

class AutomobilesTest < ApplicationSystemTestCase
  setup do
    @automobile = automobiles(:one)
  end

  test "visiting the index" do
    visit automobiles_url
    assert_selector "h1", text: "Automobiles"
  end

  test "should create automobile" do
    visit automobiles_url
    click_on "New automobile"

    fill_in "Horse power", with: @automobile.horse_power
    fill_in "Name", with: @automobile.name
    fill_in "Price", with: @automobile.price
    click_on "Create Automobile"

    assert_text "Automobile was successfully created"
    click_on "Back"
  end

  test "should update Automobile" do
    visit automobile_url(@automobile)
    click_on "Edit this automobile", match: :first

    fill_in "Horse power", with: @automobile.horse_power
    fill_in "Name", with: @automobile.name
    fill_in "Price", with: @automobile.price
    click_on "Update Automobile"

    assert_text "Automobile was successfully updated"
    click_on "Back"
  end

  test "should destroy Automobile" do
    visit automobile_url(@automobile)
    click_on "Destroy this automobile", match: :first

    assert_text "Automobile was successfully destroyed"
  end
end
