require_relative 'storage/storage'
require_relative 'dll/double_link_list'
require_relative 'cache'
cache = Cache.new(5)

cache.put('1', "hello 1")
cache.put('2', "hello 2")
cache.put('3', "hello 3")
cache.put('4', "hello 4")
cache.put('5', "hello 5")
cache.put('6', "hello 6")


cache.get('1')
cache.get('3')
