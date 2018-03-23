class ProviderPolicy < ApplicationPolicy

  def create?
    true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end
private

  def user_is_owner_or_admin?
    if user
      record.user == user || user.admin
    else
      false
    end
  end
end


