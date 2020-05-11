# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  #ログイン状態で:new, :createを実行するために必要。(デフォルトでは、ログインしていないことが求められている。)
  #そして"Send me reset password instructions"を押すとエラーが出るが、原因はよくわからない。ひとまずこれでOKとしたいです。
  prepend_before_action :require_no_authentication, except: [:new, :create]

  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
