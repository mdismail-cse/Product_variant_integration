require "application_system_test_case"

class AtrValuesTest < ApplicationSystemTestCase
  setup do
    @atr_value = atr_values(:one)
  end

  test "visiting the index" do
    visit atr_values_url
    assert_selector "h1", text: "Atr values"
  end

  test "should create atr value" do
    visit atr_values_url
    click_on "New atr value"

    fill_in "Atribute", with: @atr_value.atribute_id
    fill_in "Value", with: @atr_value.value
    click_on "Create Atr value"

    assert_text "Atr value was successfully created"
    click_on "Back"
  end

  test "should update Atr value" do
    visit atr_value_url(@atr_value)
    click_on "Edit this atr value", match: :first

    fill_in "Atribute", with: @atr_value.atribute_id
    fill_in "Value", with: @atr_value.value
    click_on "Update Atr value"

    assert_text "Atr value was successfully updated"
    click_on "Back"
  end

  test "should destroy Atr value" do
    visit atr_value_url(@atr_value)
    click_on "Destroy this atr value", match: :first

    assert_text "Atr value was successfully destroyed"
  end
end
