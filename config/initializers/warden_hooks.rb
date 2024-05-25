Warden::Manager.after_set_user do |user, auth, opts|
  if user.tenant
    Apartment::Tenant.switch!(user.tenant.name)
    Rails.logger.info "====   Switched to tenant: #{user.tenant.name}"
  else
    Apartment::Tenant.switch!('public') # Fallback to a default schema if tenant is not present
    Rails.logger.info "====    Switched to public schema"
  end
end

# Warden::Manager.before_logout do |user, auth, opts|
#   Apartment::Tenant.reset
#   Rails.logger.info "Reset to public schema"
# end