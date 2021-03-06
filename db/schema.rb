# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_519_190_655) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'grocery_items', force: :cascade do |t|
    t.bigint 'grocery_list_id', null: false
    t.bigint 'user_id', null: false
    t.string 'name'
    t.integer 'amount'
    t.boolean 'active'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['grocery_list_id'], name: 'index_grocery_items_on_grocery_list_id'
    t.index ['user_id'], name: 'index_grocery_items_on_user_id'
  end

  create_table 'grocery_lists', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_grocery_lists_on_user_id'
  end

  create_table 'invitations', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'invitee_type', null: false
    t.bigint 'invitee_id', null: false
    t.bigint 'grocery_list_id', null: false
    t.boolean 'accepted'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['grocery_list_id'], name: 'index_invitations_on_grocery_list_id'
    t.index %w[invitee_type invitee_id], name: 'index_invitations_on_invitee'
    t.index ['user_id'], name: 'index_invitations_on_user_id'
  end

  create_table 'user_grocery_lists', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'grocery_list_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['grocery_list_id'], name: 'index_user_grocery_lists_on_grocery_list_id'
    t.index ['user_id'], name: 'index_user_grocery_lists_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'grocery_items', 'grocery_lists'
  add_foreign_key 'grocery_items', 'users'
  add_foreign_key 'grocery_lists', 'users'
  add_foreign_key 'invitations', 'grocery_lists'
  add_foreign_key 'invitations', 'users'
  add_foreign_key 'user_grocery_lists', 'grocery_lists'
  add_foreign_key 'user_grocery_lists', 'users'
end
