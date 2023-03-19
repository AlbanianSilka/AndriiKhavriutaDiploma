require "application_system_test_case"

class IndicatorsTest < ApplicationSystemTestCase
  setup do
    @indicator = indicators(:one)
  end

  test "visiting the index" do
    visit indicators_url
    assert_selector "h1", text: "Indicators"
  end

  test "should create indicator" do
    visit indicators_url
    click_on "New indicator"

    fill_in "Mechanism", with: @indicator.mechanism_id
    fill_in "Name", with: @indicator.name
    fill_in "Values", with: @indicator.values
    click_on "Create Indicator"

    assert_text "Indicator was successfully created"
    click_on "Back"
  end

  test "should update Indicator" do
    visit indicator_url(@indicator)
    click_on "Edit this indicator", match: :first

    fill_in "Mechanism", with: @indicator.mechanism_id
    fill_in "Name", with: @indicator.name
    fill_in "Values", with: @indicator.values
    click_on "Update Indicator"

    assert_text "Indicator was successfully updated"
    click_on "Back"
  end

  test "should destroy Indicator" do
    visit indicator_url(@indicator)
    click_on "Destroy this indicator", match: :first

    assert_text "Indicator was successfully destroyed"
  end
end
