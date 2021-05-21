# frozen_string_literal: true

class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :invitee, polymorphic: true, null: false
      t.belongs_to :grocery_list, null: false, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
