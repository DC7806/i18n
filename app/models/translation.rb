class Translation < ApplicationRecord
  def self.select_key(key)
    where(key: key)
  end
  # why .self when it is used as instance method?

end
