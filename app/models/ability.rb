class Ability
  include CanCan::Ability

  def initialize(user)
    can [:index], Location
  end
end