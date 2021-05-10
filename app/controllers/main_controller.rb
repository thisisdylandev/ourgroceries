class MainController < ApplicationController
  def index
    if user_signed_in?
      redirect_to grocery_lists_path
    else
      render "index"
    end
  end
end