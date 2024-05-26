class Admin::UserPolicy < ApplicationPolicy
  def new?
    user.has_role?('admin') || user.has_role?('tenant_admin')
  end

  def create?
    user.has_role?('admin') || user.has_role?('tenant_admin')
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.has_role?('admin') || user.has_role?('tenant_admin')
        scope.all
      end
    end
  end
end
