# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :invitee, polymorphic: true
  belongs_to :grocery_list

  broadcasts_to :grocery_list
end
