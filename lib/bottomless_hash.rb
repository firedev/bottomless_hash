require "bottomless_hash/version"

class BottomlessHash < Hash
  def initialize
    super &-> h, k { h[k] = self.class.new }
  end

  def self.from_hash(hash)
    new.merge(hash)
  end
end

class Hash
  def bottomless
    BottomlessHash.from_hash(self)
  end
end
