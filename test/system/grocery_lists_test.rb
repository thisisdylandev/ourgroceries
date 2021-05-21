# frozen_string_literal: true

require 'application_system_test_case'

class GroceryListsTest < ApplicationSystemTestCase
  setup do
    @grocery_list = grocery_lists(:one)
  end

  test 'visiting the index' do
    visit grocery_lists_url
    assert_selector 'h1', text: 'Grocery Lists'
  end

  test 'creating a Grocery list' do
    visit grocery_lists_url
    click_on 'New Grocery List'

    fill_in 'Name', with: @grocery_list.name
    fill_in 'User', with: @grocery_list.user_id
    click_on 'Create Grocery list'

    assert_text 'Grocery list was successfully created'
    click_on 'Back'
  end

  test 'updating a Grocery list' do
    visit grocery_lists_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @grocery_list.name
    fill_in 'User', with: @grocery_list.user_id
    click_on 'Update Grocery list'

    assert_text 'Grocery list was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Grocery list' do
    visit grocery_lists_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Grocery list was successfully destroyed'
  end
end
