class Node
  attr_accessor :next, :prev, :data
  def initialize(data)
    @next = nil
    @prev = nil
    @data = data
  end
end