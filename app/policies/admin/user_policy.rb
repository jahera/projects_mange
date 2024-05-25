class Admin::UserPolicy < ApplicationPolicy
  def new?
    user.has_role?('admin')
  end

  def create?
    user.has_role?('admin')
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.has_role?('admin')
        scope.all
      end
    end
  end
end
