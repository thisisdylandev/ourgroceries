class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :grocery_lists
  has_many :user_grocery_lists
  has_many :grocery_items
  has_many :invitations
  has_many :invitations, as: :invitee
end
