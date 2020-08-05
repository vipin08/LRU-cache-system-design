require_relative 'storage/storage'
require_relative 'dll/double_link_list'

class Cache

  def initialize capacity
    @storage = Storage.new(capacity)
  end

  def put(key, value)
    begin
      @storage.add(key, value)
    rescue StorageFullException
      p "Storage full starting eviction policy"
      least_key = @storage.lru_policy
      @storage.eviction least_key
      @storage.add(key, value)
    end
  end

  def get(key)
    begin
      return @storage.get(key)
    rescue NotFoundException
      p "Key not found"
    end
  end
end