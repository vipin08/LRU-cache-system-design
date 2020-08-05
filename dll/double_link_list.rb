require_relative 'node'
require './exceptions/not_found_exception'

class DoubleLinkList
  attr_accessor :head
  def initialize
    @head = nil
    @tail = nil
  end

  def push(data)
      new_node = Node.new(data)
      new_node.next = @head
      if @head.nil?
        @tail = new_node
        @head = new_node
      else
        @head.prev = new_node
      end
  end

  def append(data)
    new_node = Node.new(data)
    last = @head
    if @head.nil?
      @head = new_node
      return
    end
    while(!last.next.nil?)
      last = last.next
    end
    last.next = new_node
    new_node.prev = last
  end

  def remove_least
    return NotFoundException if @head.nil?
    temp = @head
    @head = temp.next
  end

  def delete key
    return false if key.nil? or @head.nil?
    temp = @head
    data_node = nil
    while(!temp.next.nil?)
      if temp.data == key
        data_node = temp
        break
      end
      temp = temp.next
    end
    if data_node.nil?
      raise NotFoundException
    end
    next_node = data_node.next
    pre_node = data_node.prev
    next_node.prev = pre_node if !next_node.nil?
    pre_node.next = next_node if !pre_node.nil?
  end

  def lru
    return @head.data
  end
end
