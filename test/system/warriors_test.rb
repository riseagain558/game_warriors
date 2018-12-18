require "application_system_test_case"

class WarriorsTest < ApplicationSystemTestCase
  setup do
    @warrior = warriors(:one)
  end

  test "visiting the index" do
    visit warriors_url
    assert_selector "h1", text: "Warriors"
  end

  test "creating a Warrior" do
    visit warriors_url
    click_on "New Warrior"

    fill_in "Name", with: @warrior.name
    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    click_on "Create Warrior"

    assert_text "Warrior was successfully created"
    click_on "Back"
  end

  test "updating a Warrior" do
    visit warriors_url
    click_on "Edit", match: :first

    fill_in "Name", with: @warrior.name
    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    click_on "Update Warrior"

    assert_text "Warrior was successfully updated"
    click_on "Back"
  end

  test "destroying a Warrior" do
    visit warriors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warrior was successfully destroyed"
  end
end
