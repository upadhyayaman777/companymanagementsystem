require "application_system_test_case"

class LeafsTest < ApplicationSystemTestCase
  setup do
    @leaf = leafs(:one)
  end

  test "visiting the index" do
    visit leafs_url
    assert_selector "h1", text: "Leafs"
  end

  test "should create leaf" do
    visit leafs_url
    click_on "New leaf"

    fill_in "Employee", with: @leaf.employee_id
    fill_in "End date", with: @leaf.end_date
    fill_in "Reason", with: @leaf.reason
    fill_in "Start date", with: @leaf.start_date
    fill_in "Status", with: @leaf.status
    click_on "Create Leaf"

    assert_text "Leaf was successfully created"
    click_on "Back"
  end

  test "should update Leaf" do
    visit leaf_url(@leaf)
    click_on "Edit this leaf", match: :first

    fill_in "Employee", with: @leaf.employee_id
    fill_in "End date", with: @leaf.end_date
    fill_in "Reason", with: @leaf.reason
    fill_in "Start date", with: @leaf.start_date
    fill_in "Status", with: @leaf.status
    click_on "Update Leaf"

    assert_text "Leaf was successfully updated"
    click_on "Back"
  end

  test "should destroy Leaf" do
    visit leaf_url(@leaf)
    click_on "Destroy this leaf", match: :first

    assert_text "Leaf was successfully destroyed"
  end
end
