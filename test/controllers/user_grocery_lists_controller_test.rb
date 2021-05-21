# frozen_string_literal: true

require 'test_helper'

class UserGroceryListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_grocery_list = user_grocery_lists(:one)
  end

  test 'should get index' do
    get user_grocery_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_grocery_list_url
    assert_response :success
  end

  test 'should create user_grocery_list' do
    assert_difference('UserGroceryList.count') do
      post user_grocery_lists_url,
           params: { user_grocery_list: { grocery_list_id: @user_grocery_list.grocery_list_id,
                                          user_id: @user_grocery_list.user_id } }
    end

    assert_redirected_to user_grocery_list_url(UserGroceryList.last)
  end

  test 'should show user_grocery_list' do
    get user_grocery_list_url(@user_grocery_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_grocery_list_url(@user_grocery_list)
    assert_response :success
  end

  test 'should update user_grocery_list' do
    patch user_grocery_list_url(@user_grocery_list),
          params: { user_grocery_list: { grocery_list_id: @user_grocery_list.grocery_list_id,
                                         user_id: @user_grocery_list.user_id } }
    assert_redirected_to user_grocery_list_url(@user_grocery_list)
  end

  test 'should destroy user_grocery_list' do
    assert_difference('UserGroceryList.count', -1) do
      delete user_grocery_list_url(@user_grocery_list)
    end

    assert_redirected_to user_grocery_lists_url
  end
end
