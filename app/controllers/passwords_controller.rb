# frozen_string_literal: true

class PasswordsController < Devise::PasswordsController
  # GET /resource/password/new

  # POST /resource/password
  def create
    @user = User.with_reset_password_token(params[:user][:reset_password_token])
    @user.reset_password(params[:user][:password], params[:user][:password_confirmation])
    flash[:notice] = 'Password reset successfully, please sign in with your new password'
    redirect_to new_user_session_path
  end

  # GET /resource/password/edit?reset_password_token=abcdef

  # PUT /resource/password

  # protected

  # The path used after sending reset password instructions
end
