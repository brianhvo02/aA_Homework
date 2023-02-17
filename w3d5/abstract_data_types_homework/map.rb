class Map
    def initialize
        @store = []
    end

    def set(key, value)
        pairs = store.select { |kv| kv[0] == key }[0]

        if pairs.nil?
            store << [key, value]
        else
            pairs[1] = value
        end
        
        self
    end

    def get(key)
        pair = store.select { |kv| kv[0] == key }[0]
        return if pair.nil?

        pair[1]
    end

    def delete(key)
        pair = store.select { |kv| kv[0] == key }[0]
        return if pair.nil?

        store.delete(pair)
    end

    def show
        print "{ "
        print store.map { |pair| "#{pair[0]}: #{pair[1]}" }.join(", ")
        print " }"
    end
    
    private
    attr_reader :store
end