class SystemProfile < ApplicationRecord

  validates :code, uniqueness: true

  @_cache = {}

  class << self

    def init_password
      cache_get(:init_password).v
    end

    def cache_get(key)
      unless @_cache.include?(key)
        @_cache[key] = self.where(code: key).first
      end
      @_cache[key]
    end
  end

end
