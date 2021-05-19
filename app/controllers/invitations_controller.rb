class InvitationsController < ApplicationController
  before_action :authenticate_user!

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  # POST /invitations or /invitations.json
  def create
    @invitation = Invitation.new
    @invitation.user = current_user
    @invitation.grocery_list = GroceryList.find(params[:grocery_list_id])
    @invitation.invitee = User.find_by(email: params[:invitation][:invitee])
    @invitation.accepted = false

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to grocery_lists_url, notice: "Grocery list was successfully shared." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invitations/1 or /invitations/1.json
  def update
    @invitation = Invitation.find(params[:id])
    logger.info(@invitation.inspect)
    respond_to do |format|
      if @invitation.update({:accepted=>true})
        format.html { redirect_to grocery_lists_path, notice: "Invitation was accepted." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end
end