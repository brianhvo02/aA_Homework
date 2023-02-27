class LRUCache
    def initialize(size)
        @size = size
        @cache = []
    end

    def count
        # returns number of elements currently in cache
        cache.count
    end

    def add(el)
        # adds element to cache according to LRU principle
        unless cache.include?(el)
            cache << el
            cache.shift if count > size
        else
            cache.delete(el) 
            cache << el
        end
    end

    def show
        # shows the items in the cache, with the LRU item first
        p cache
    end

    private
    # helper methods go here!
    attr_reader :cache, :size
end