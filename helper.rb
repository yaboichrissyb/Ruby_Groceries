module Helper

  def to_bool
    return true if self == "true"
    return false if self == "false"
  end

  def split_underscore
    self.gsub!(/\_/, " ")
  end

end

class String; include Helper; end