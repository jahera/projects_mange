class DashboardPolicy < ApplicationPolicy
  def index?
    user.has_role?('admin')
  end

  def tenant_dashboard?
    user.has_role?('tenant_admin')
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.has_role?('admin') || user.has_role?('tenant_admin')
        scope.all
      end
    end
  end
end