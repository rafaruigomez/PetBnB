class FlatPolicy < ApplicationPolicy


  def create?
    true
  end

  def show?
    # record == @restaurant
    # user == current_user
    # record.user == user
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
