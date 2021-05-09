class UserGroceryListsController < ApplicationController
  before_action :set_user_grocery_list, only: %i[ show edit update destroy ]

  # GET /user_grocery_lists or /user_grocery_lists.json
  def index
    @user_grocery_lists = UserGroceryList.all
  end

  # GET /user_grocery_lists/1 or /user_grocery_lists/1.json
  def show
  end

  # GET /user_grocery_lists/new
  def new
    @user_grocery_list = UserGroceryList.new
  end

  # GET /user_grocery_lists/1/edit
  def edit
  end

  # POST /user_grocery_lists or /user_grocery_lists.json
  def create
    @user_grocery_list = UserGroceryList.new(user_grocery_list_params)

    respond_to do |format|
      if @user_grocery_list.save
        format.html { redirect_to @user_grocery_list, notice: "User grocery list was successfully created." }
        format.json { render :show, status: :created, location: @user_grocery_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_grocery_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_grocery_lists/1 or /user_grocery_lists/1.json
  def update
    respond_to do |format|
      if @user_grocery_list.update(user_grocery_list_params)
        format.html { redirect_to @user_grocery_list, notice: "User grocery list was successfully updated." }
        format.json { render :show, status: :ok, location: @user_grocery_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_grocery_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_grocery_lists/1 or /user_grocery_lists/1.json
  def destroy
    @user_grocery_list.destroy
    respond_to do |format|
      format.html { redirect_to user_grocery_lists_url, notice: "User grocery list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_grocery_list
      @user_grocery_list = UserGroceryList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_grocery_list_params
      params.require(:user_grocery_list).permit(:user_id, :grocery_list_id)
    end
end
