class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  respond_to :html, :json, :js

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # include CompleteMyInfoAndResetPassword

  layout :select_layout

  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:error] = exception.message
  #   logger.error "#{exception.backtrace.join("\n")}"
  #   redirect_back fallback_location: root_path
  # end
  # rescue_from ActiveRecord::RecordNotFound do |exception|
  #   flash.now[:error] = exception.message
  #   logger.error "#{exception.backtrace.join("\n")}"
  #   redirect_to "/error", :error => exception.message
  # end
  # rescue_from Exception do |exception|
  #   flash.now[:error] = exception.message
  #   logger.error "#{exception.backtrace.join("\n")}"
  #   redirect_to "/error", :error => exception.message
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username, :email, :password, :password_confirmation, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:login, :username, :email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password)  }
  end

  def select_layout
    devise_controller? ? "devise" : "app"
  end

  # 同意条件设置
  def condition(clz)
    cond = {}
    clz.attribute_names.each do |attr|
      if attr.to_sym != :id and params.include? attr and !params[attr].blank? and params[attr] != "_"
        cond[attr.to_sym] = params[attr]
      end
    end
    cond
  end

end
