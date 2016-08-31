module BaseClassMethods

  def included_init
    const_set :STATES, all_states

    validates :state, inclusion: { in: const_get(:STATES) }

    xxx_extend "state", const_get(:STATES)

    before_validation on: :create do |record|
      record.state = record.class.const_get(:STATES)[-1] unless record.state
    end

  end

  def xxx_extend(xxx, constant)
    xxx_all(xxx, constant)
    constant.each do |t|
      xxx_constant = "#{xxx.upcase}_#{t.upcase}"
      const_set xxx_constant, "#{t}"
      class_eval <<-RUBY_EVAL, __FILE__, __LINE__
          def #{xxx}_is_#{t}?
            self.#{xxx} == #{xxx_constant}
          end
      RUBY_EVAL
      _where = {}
      _where["#{xxx}"] = t
      scope t.to_s.pluralize.to_sym, -> {where(_where)}
    end
  end

  def xxx_all(xxx, constant)
    const_set "#{xxx.upcase}_ALL", constant.map {|x| [self.human_attribute_name("#{xxx}_#{x}"), x]}
  end

  def add_states
    []
  end

  def all_states
    add_states + ["deleted", "disabled", "able"]
  end

end