class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :name_family_zen, :name_first_zen, :name_family_kana, :name_first_kana,
                                             :birth])
  end
end
