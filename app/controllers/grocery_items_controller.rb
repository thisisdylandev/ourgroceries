class GroceryItemsController < ApplicationController
  before_action :authenticate_user!

  # POST /grocery_items or /grocery_items.json
  def create
    set_grocery_list
    @grocery_item = @grocery_list.grocery_items.new(grocery_item_params)
    @grocery_item.user = current_user

    respond_to do |format|
      if @grocery_item.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace("form", partial: "grocery_items/form", locals: { grocery_list: @grocery_list, grocery_item: GroceryItem.new}) }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("form", partial: "grocery_items/form", locals: { grocery_list: @grocery_list, grocery_item: @grocery_item}) }
      end
    end
  end

  # DELETE /grocery_items/1 or /grocery_items/1.json
  def destroy
    puts params
    set_grocery_item
    @grocery_item.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@grocery_item) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery_item
      @grocery_item = GroceryItem.find(params[:id])
    end

    def set_grocery_list
      @grocery_list = GroceryList.find(params[:grocery_list_id])
    end

    # Only allow a list of trusted parameters through.
    def grocery_item_params
      params.require(:grocery_item).permit(:grocery_list_id, :user_id, :name, :amount, :active)
    end
end
