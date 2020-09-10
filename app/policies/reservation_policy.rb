class ReservationPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    # record == @restaurant
    # user == current_user
    record.user == user
    # true
  end

  def update?
    # record == @restaurant
    # user == current_user
    record.user == user || record.flat.user == user
    # true
  end


  def destroy?
    # record == @restaurant
    # user == current_user
    record.user == user
    # true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
