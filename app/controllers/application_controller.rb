class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path
      end
    end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
