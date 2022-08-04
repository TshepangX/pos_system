class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
      def resolve
        scope.all
      end
   end

  def index?
   user.cashier? || user.manager? || user.owner?
  end

  def show?
    user.owner? ||user.manager?
  end

  def new?
    user.owner? ||user.manager?
  end 

  def create?
    user.owner? || user.manager?
  end 

  def edit?
    user.owner? ||user.manager? 
  end 

  def update?
    user.owner? ||user.manager?
  end 

  def destroy? 
    user.owner?
  end 
end 
 


