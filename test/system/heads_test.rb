require "application_system_test_case"

class HeadsTest < ApplicationSystemTestCase
  setup do
    @head = heads(:one)
  end

  test "visiting the index" do
    visit heads_url
    assert_selector "h1", text: "Heads"
  end

  test "creating a Head" do
    visit heads_url
    click_on "New Head"

    click_on "Create Head"

    assert_text "Head was successfully created"
    click_on "Back"
  end

  test "updating a Head" do
    visit heads_url
    click_on "Edit", match: :first

    click_on "Update Head"

    assert_text "Head was successfully updated"
    click_on "Back"
  end

  test "destroying a Head" do
    visit heads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Head was successfully destroyed"
  end
end
