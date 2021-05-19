class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :invitee, polymorphic: true
  belongs_to :grocery_list
end
