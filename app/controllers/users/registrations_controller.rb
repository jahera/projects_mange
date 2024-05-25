# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters


  def create
    super do |resource|
      if resource.persisted? && resource.tenant_admin?
        resource.create_tenant(resource.organization_name)
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_role_id, :first_name, :last_name, :organization_name, :tenant_id])
  end

  def after_sign_up_path_for(resource)
    admin_root_path
  end
end
