
class Hash
  def merge_recursive! h2
    me = self
    h2.each do |k, v|
      if v.is_a? Hash
        me[k] = me[k].merge_recursive v
      else
        me[k] = v
      end
    end
    me
  end

  def merge_recursive h2
    self.dup.merge_recursive! h2.dup
  end
end
