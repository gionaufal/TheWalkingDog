class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == Walker
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :name, :age, :address, :cpf, :bio, :experience,
        :price, :phone, :region
      ])
    end
  end
end
