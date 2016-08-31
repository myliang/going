class Ability
  include CanCan::Ability

  ROLE_RESOURCES = {
      Role: [:create, :update, :read],
      User: [:create, :update, :read, :pwd]
  }

  # 需要隐藏的菜单
  ROLE_RESOURCE_HIDES = []

  # 某些资源的编辑权限，必须是创建的用户
  ROLE_RESOURCE_USER = {}

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    if user.blank?
      cannot :manage, :all
    elsif user.is_admin?
      can :manage, :all
    else
      # puts "#{user.role.to_json}"
      if user.role
        user_role(user)
      else
        default_role
      end
    end
  end

  def user_role(user)
    user.role.rule.each do |k, v|
      v.each do |o|
        # puts ":#{k}:: #{o}"
        # puts "::>>>#{ROLE_RESOURCE_USER}<<<<"
        if ROLE_RESOURCE_USER.include?(k.to_sym) and ROLE_RESOURCE_USER[k.to_sym].include?(o.to_sym)
          # puts "::: #{o}::: #{k.constantize}:: #{user.id}"
          can o.to_sym, k.constantize, user_id: user.id
        else
          can o.to_sym, k.constantize
        end
      end

    end
  end

  def default_role
    cannot :manage, :all
  end
end
