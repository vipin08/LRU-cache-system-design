require './exceptions/not_found_exception'
require './exceptions/storage_full_exception'
require './dll/double_link_list'
class Storage < NotFoundException
  attr_accessor :capacity, :dll

  @@hash_storage = {} # in memory db
  @@capacity = 10 # in memeory default capacity
  @@dll = DoubleLinkList.new # in memory LRU Linklist

  def initialize(capacity=@@capacity)
    @@capacity = capacity
  end

  def add key, value
    raise StorageFullException if is_full
    if !@@hash_storage[key].nil?
      @@dll.delete(key)
    end
    @@hash_storage[key] = value
    @@dll.append(key)
  end

  def remove key
    raise NotFoundException if @@hash_storage[key].nil?
    @@hash_storage.delete(key)
    @@dll.delete(key)
  end

  def eviction key
    raise NotFoundException if @@hash_storage[key].nil?
    @@hash_storage.delete(key)
    @@dll.remove_least
  end

  def get key
    raise NotFoundException if @@hash_storage[key].nil?
    return @@hash_storage[key]
  end

  def show_db
    return @@hash_storage
  end

  def lru_policy
    return @@dll.lru
  end

  private
  def is_full
    return (@@hash_storage.keys.count >= @@capacity)
  end

end
