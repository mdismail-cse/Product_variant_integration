require "application_system_test_case"

class AtributesTest < ApplicationSystemTestCase
  setup do
    @atribute = atributes(:one)
  end

  test "visiting the index" do
    visit atributes_url
    assert_selector "h1", text: "Atributes"
  end

  test "should create atribute" do
    visit atributes_url
    click_on "New atribute"

    fill_in "Type", with: @atribute.type
    click_on "Create Atribute"

    assert_text "Atribute was successfully created"
    click_on "Back"
  end

  test "should update Atribute" do
    visit atribute_url(@atribute)
    click_on "Edit this atribute", match: :first

    fill_in "Type", with: @atribute.type
    click_on "Update Atribute"

    assert_text "Atribute was successfully updated"
    click_on "Back"
  end

  test "should destroy Atribute" do
    visit atribute_url(@atribute)
    click_on "Destroy this atribute", match: :first

    assert_text "Atribute was successfully destroyed"
  end
end
