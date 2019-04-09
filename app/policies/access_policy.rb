class AccessPolicy
  include AccessGranted::Policy

  def configure
    # Example policy for AccessGranted.
    # For more details check the README at
    #
    # https://github.com/chaps-io/access-granted/blob/master/README.md
    #
    # Roles inherit from less important roles, so:
    # - :admin has permissions defined in :member, :guest and himself
    # - :member has permissions from :guest and himself
    # - :guest has only its own permissions since it's the first role.
    #
    # The most important role should be at the top.
    # In this case an administrator.
    #
    role :admin, proc { |user| user.admin? } do
      can :manage, User
      can :manage, Ticket
      can :manage, Collaborator
      can :manage, Category
      can :manage, Device
      can :manage, Disrepare
      can :manage, Operation
      can :manage, Feedback
      can :manage, Part
      can :manage, Brand
      can :manage, Model
      can :manage, Customer
    end

    # master
    role :master, proc { |user| user.master? } do
      can :manage, Ticket
      can [:read, :create, :update], Part
      can [:read, :create, :update], Category
      can [:read, :create, :update], Brand
      can [:read, :create, :update], Model
      can [:read, :create, :update], Disrepare
      can [:read, :create, :update], Operation
      can :manage, Customer

    end

    # Reception
    role :reception, proc { |user| user.reception? } do
      can [:read, :create, :update], Device
      can [:read, :create, :update], Customer
      can [:read, :create, :update], Ticket
      can :read, Category
      can :read, Brand
      can :read, Model
      can :read, Disrepare
      can :read, Operation

    end

    # More privileged role, applies to registered users.
    role :customer, proc { |user| user.customer? } do
      can :create, Feedback
      can [:update, :destroy], Feedback do |feedback, current_user|
        feedback.user == current_user
      end
      can [:update, :destroy], User do |user, current_user|
        user == current_user
      end
    end

    # The base role with no additional conditions.
    # Applies to every user.
    #
    role :guest do
     can :read, Feedback
    end
  end
end
