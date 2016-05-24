module Uniqueness
  def self.unique(array)
    raise ArgumentError, "Argument isn't an array" unless array.is_a? Array

    return_hash = {}
    array.each { |email| return_hash[email] = nil }

    return_hash.keys
  end
end
