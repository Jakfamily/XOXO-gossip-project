class ApplicationController < ActionController::Base
  # Avant d'exécuter une action d'un contrôleur Devise, exécute la méthode `configure_devise_parameters`
  before_action :configure_devise_parameters, if: :devise_controller?
  
  # Méthode pour configurer les paramètres Devise
  def configure_devise_parameters
    # Permet les paramètres spécifiés lors de l'inscription (sign_up)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :description, :email, :password, :password_confirmation])
    
    # Permet les paramètres spécifiés lors de la mise à jour du compte (account_update)
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :description, :email, :password, :password_confirmation])
  end
    
  
  # Méthode pour obtenir le prénom de l'utilisateur
  def user_first_name
    first_name
  end
end

