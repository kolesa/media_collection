class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def redirect_message(object = nil)
    flash.now[:alert] = object.errors.full_messages.join(', ') if object.try(:errors)
  end

  def notice_on(method = nil)
    return nil if method.nil?
    t "flash.notice.on_#{method}"
  end
end
