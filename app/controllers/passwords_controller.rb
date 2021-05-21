# frozen_string_literal: true

class PasswordsController < Devise::PasswordsController
  # GET /resource/password/new

  # POST /resource/password
  def create
    logger.debug '##############'
    logger.debug '##############'
    logger.debug '##############'
    logger.debug '##############'
    logger.debug '##############'
    logger.debug '##############'

    if params[:user].key?(:reset_password_token)
      begin
        @user = User.with_reset_password_token(params[:user][:reset_password_token])
        @user.reset_password(params[:user][:password], params[:user][:password_confirmation])
      rescue NoMethodError
        flash[:alert] = 'An error occurred, please try again.'
        redirect_to new_user_password_path
      else
        flash[:notice] = 'Password reset successfully, please sign in with your new password'
        redirect_to new_user_session_path
      end
    else
      @user = User.find_by(email: params[:user][:email])
      @user.send_reset_password_instructions
      flash[:notice] = 'Emailed instructions on how to reset password'
      redirect_to new_user_session_path
    end
    
  end

  # GET /resource/password/edit?reset_password_token=abcdef

  # PUT /resource/password

  # protected

  # The path used after sending reset password instructions
end
