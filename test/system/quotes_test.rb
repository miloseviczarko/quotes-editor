require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = Quote.ordered.first
  end

  test "Creating new Quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "New quote"
    assert_selector "h1", text: "Quotes"

    fill_in "Name", with: "Fresh quote"
    click_on "Create quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Fresh quote"
  end

  test "Showing quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_link @quote.name
    assert_selector "h1", text: @quote.name
  end

  test "Update a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Quotes"

    fill_in "Name", with: "Updated Quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated Quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
