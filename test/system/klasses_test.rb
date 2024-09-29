require "application_system_test_case"

class KlassesTest < ApplicationSystemTestCase
  setup do
    @klass = klasses(:one)
  end

  test "visiting the index" do
    visit klasses_url
    assert_selector "h1", text: "Klasses"
  end

  test "should create klass" do
    visit klasses_url
    click_on "New klass"

    fill_in "Identifier", with: @klass.identifier
    click_on "Create Klass"

    assert_text "Klass was successfully created"
    click_on "Back"
  end

  test "should update Klass" do
    visit klass_url(@klass)
    click_on "Edit this klass", match: :first

    fill_in "Identifier", with: @klass.identifier
    click_on "Update Klass"

    assert_text "Klass was successfully updated"
    click_on "Back"
  end

  test "should destroy Klass" do
    visit klass_url(@klass)
    click_on "Destroy this klass", match: :first

    assert_text "Klass was successfully destroyed"
  end
end
