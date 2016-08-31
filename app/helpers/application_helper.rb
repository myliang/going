module ApplicationHelper

  def user_role_rules
    rules = current_user.role_rule
    rules.select {|k, v| !Ability::ROLE_RESOURCE_HIDES.include?(k.to_s) and v.map{|e| e.to_sym }.include?(:read) }
  end

  def user_menus_functions(menu = nil)
    mfs = {}
    user_role_rules.each do |k, v|
      Ability::ROLE_MENUS.each do |k1, v1|
        if v1.include?(k.to_s)
          mfs[k1] = {} unless mfs.include?(k1)
          mfs[k1][k] = v
          break
        end
      end
    end
    menu ? mfs[menu.to_sym] : mfs
  end

end
