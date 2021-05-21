# frozen_string_literal: true

require 'test_helper'

class GroceryListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grocery_list = grocery_lists(:one)
  end

  test 'should get index' do
    get grocery_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_grocery_list_url
    assert_response :success
  end

  test 'should create grocery_list' do
    assert_difference('GroceryList.count') do
      post grocery_lists_url, params: { grocery_list: { name: @grocery_list.name, user_id: @grocery_list.user_id } }
    end

    assert_redirected_to grocery_list_url(GroceryList.last)
  end

  test 'should show grocery_list' do
    get grocery_list_url(@grocery_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_grocery_list_url(@grocery_list)
    assert_response :success
  end

  test 'should update grocery_list' do
    patch grocery_list_url(@grocery_list),
          params: { grocery_list: { name: @grocery_list.name, user_id: @grocery_list.user_id } }
    assert_redirected_to grocery_list_url(@grocery_list)
  end

  test 'should destroy grocery_list' do
    assert_difference('GroceryList.count', -1) do
      delete grocery_list_url(@grocery_list)
    end

    assert_redirected_to grocery_lists_url
  end
end
