# frozen_string_literal: true

require 'test_helper'

class GroceryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grocery_item = grocery_items(:one)
  end

  test 'should get index' do
    get grocery_items_url
    assert_response :success
  end

  test 'should get new' do
    get new_grocery_item_url
    assert_response :success
  end

  test 'should create grocery_item' do
    assert_difference('GroceryItem.count') do
      post grocery_items_url,
           params: { grocery_item: { active: @grocery_item.active, amount: @grocery_item.amount,
                                     grocery_list_id: @grocery_item.grocery_list_id, name: @grocery_item.name, user_id: @grocery_item.user_id } }
    end

    assert_redirected_to grocery_item_url(GroceryItem.last)
  end

  test 'should show grocery_item' do
    get grocery_item_url(@grocery_item)
    assert_response :success
  end

  test 'should get edit' do
    get edit_grocery_item_url(@grocery_item)
    assert_response :success
  end

  test 'should update grocery_item' do
    patch grocery_item_url(@grocery_item),
          params: { grocery_item: { active: @grocery_item.active, amount: @grocery_item.amount,
                                    grocery_list_id: @grocery_item.grocery_list_id, name: @grocery_item.name, user_id: @grocery_item.user_id } }
    assert_redirected_to grocery_item_url(@grocery_item)
  end

  test 'should destroy grocery_item' do
    assert_difference('GroceryItem.count', -1) do
      delete grocery_item_url(@grocery_item)
    end

    assert_redirected_to grocery_items_url
  end
end
