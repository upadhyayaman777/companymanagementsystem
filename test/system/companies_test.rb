require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "should create company" do
    visit companies_url
    click_on "New company"

    fill_in "Address", with: @company.address
    fill_in "Contact", with: @company.contact
    fill_in "Email", with: @company.email
    fill_in "Founding date", with: @company.founding_date
    fill_in "Industry type", with: @company.industry_type
    fill_in "Name", with: @company.name
    fill_in "Regestration number", with: @company.regestration_number
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "should update Company" do
    visit company_url(@company)
    click_on "Edit this company", match: :first

    fill_in "Address", with: @company.address
    fill_in "Contact", with: @company.contact
    fill_in "Email", with: @company.email
    fill_in "Founding date", with: @company.founding_date
    fill_in "Industry type", with: @company.industry_type
    fill_in "Name", with: @company.name
    fill_in "Regestration number", with: @company.regestration_number
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "should destroy Company" do
    visit company_url(@company)
    click_on "Destroy this company", match: :first

    assert_text "Company was successfully destroyed"
  end
end
