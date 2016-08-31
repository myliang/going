module RolesHelper

  def rule_checked?(rule, k, v)
    if rule and rule.include? k
      return true if rule[k].include? v
    end
    false
  end

end
