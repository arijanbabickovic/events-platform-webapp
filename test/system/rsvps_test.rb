require "application_system_test_case"

class RsvpsTest < ApplicationSystemTestCase
  setup do
    @rsvp = rsvps(:one)
  end

  test "visiting the index" do
    visit rsvps_url
    assert_selector "h1", text: "Rsvps"
  end

  test "creating a Rsvp" do
    visit rsvps_url
    click_on "New Rsvp"

    click_on "Create Rsvp"

    assert_text "Rsvp was successfully created"
    click_on "Back"
  end

  test "updating a Rsvp" do
    visit rsvps_url
    click_on "Edit", match: :first

    click_on "Update Rsvp"

    assert_text "Rsvp was successfully updated"
    click_on "Back"
  end

  test "destroying a Rsvp" do
    visit rsvps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rsvp was successfully destroyed"
  end
end
