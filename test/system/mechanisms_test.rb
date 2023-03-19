require "application_system_test_case"

class MechanismsTest < ApplicationSystemTestCase
  setup do
    @mechanism = mechanisms(:one)
  end

  test "visiting the index" do
    visit mechanisms_url
    assert_selector "h1", text: "Mechanisms"
  end

  test "should create mechanism" do
    visit mechanisms_url
    click_on "New mechanism"

    fill_in "Name", with: @mechanism.name
    click_on "Create Mechanism"

    assert_text "Mechanism was successfully created"
    click_on "Back"
  end

  test "should update Mechanism" do
    visit mechanism_url(@mechanism)
    click_on "Edit this mechanism", match: :first

    fill_in "Name", with: @mechanism.name
    click_on "Update Mechanism"

    assert_text "Mechanism was successfully updated"
    click_on "Back"
  end

  test "should destroy Mechanism" do
    visit mechanism_url(@mechanism)
    click_on "Destroy this mechanism", match: :first

    assert_text "Mechanism was successfully destroyed"
  end
end
