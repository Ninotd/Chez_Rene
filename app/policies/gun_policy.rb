class GunPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.user != user
  end

  def update?
    record.user == user
  end
end
