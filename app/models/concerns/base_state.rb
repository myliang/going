module BaseState
  def self.included(base)
    base.extend(BaseClassMethods)
    base.included_init
  end

  def initialize(options = {})
    super(options)
    self.state = self.class.const_get(:STATES)[-1] if options.empty?
  end

end
