# frozen_string_literal: true

require 'application_system_test_case'

class GroceryItemsTest < ApplicationSystemTestCase
  setup do
    @grocery_item = grocery_items(:one)
  end

  test 'visiting the index' do
    visit grocery_items_url
    assert_selector 'h1', text: 'Grocery Items'
  end

  test 'creating a Grocery item' do
    visit grocery_items_url
    click_on 'New Grocery Item'

    check 'Active' if @grocery_item.active
    fill_in 'Amount', with: @grocery_item.amount
    fill_in 'Grocery list', with: @grocery_item.grocery_list_id
    fill_in 'Name', with: @grocery_item.name
    fill_in 'User', with: @grocery_item.user_id
    click_on 'Create Grocery item'

    assert_text 'Grocery item was successfully created'
    click_on 'Back'
  end

  test 'updating a Grocery item' do
    visit grocery_items_url
    click_on 'Edit', match: :first

    check 'Active' if @grocery_item.active
    fill_in 'Amount', with: @grocery_item.amount
    fill_in 'Grocery list', with: @grocery_item.grocery_list_id
    fill_in 'Name', with: @grocery_item.name
    fill_in 'User', with: @grocery_item.user_id
    click_on 'Update Grocery item'

    assert_text 'Grocery item was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Grocery item' do
    visit grocery_items_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Grocery item was successfully destroyed'
  end
end
