class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == Walker
      devise_parameter_sanitizer.permit(:sign_up, keys:
                                       [:name, :age, :address, :cpf, :bio,
                                        :experience, :price, :phone,
                                        :region, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys:
                                        [:age, :address, :bio,
                                        :experience, :price, :phone,
                                        :region, :avatar])

    elsif resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys:
                                       [:name, :address, :cpf, :phone])
    end
  end
end
