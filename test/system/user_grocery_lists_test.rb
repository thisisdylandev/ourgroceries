# frozen_string_literal: true

require 'application_system_test_case'

class UserGroceryListsTest < ApplicationSystemTestCase
  setup do
    @user_grocery_list = user_grocery_lists(:one)
  end

  test 'visiting the index' do
    visit user_grocery_lists_url
    assert_selector 'h1', text: 'User Grocery Lists'
  end

  test 'creating a User grocery list' do
    visit user_grocery_lists_url
    click_on 'New User Grocery List'

    fill_in 'Grocery list', with: @user_grocery_list.grocery_list_id
    fill_in 'User', with: @user_grocery_list.user_id
    click_on 'Create User grocery list'

    assert_text 'User grocery list was successfully created'
    click_on 'Back'
  end

  test 'updating a User grocery list' do
    visit user_grocery_lists_url
    click_on 'Edit', match: :first

    fill_in 'Grocery list', with: @user_grocery_list.grocery_list_id
    fill_in 'User', with: @user_grocery_list.user_id
    click_on 'Update User grocery list'

    assert_text 'User grocery list was successfully updated'
    click_on 'Back'
  end

  test 'destroying a User grocery list' do
    visit user_grocery_lists_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'User grocery list was successfully destroyed'
  end
end
