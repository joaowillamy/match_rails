class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_select, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:brazilian_state_id, :email, :password]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def configure_select
    @brazilian_states_options = BrazilianState.all.pluck(:description, :id)
  end
end
