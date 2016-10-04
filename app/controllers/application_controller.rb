class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
#  before_action :redirect_to_walker_show, if: :walker_signed_up?


  protected

  def redirect_to_walker_show
#    binding.pry

  end

  def configure_permitted_parameters
    if resource_class == Walker
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :name, :age, :address, :cpf, :bio, :experience,
        :price, :phone, :region
      ])
    end
  end
end
