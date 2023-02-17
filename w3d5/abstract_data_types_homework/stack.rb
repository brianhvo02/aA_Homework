class Stack
    def initialize
        @store = []
    end

    def push(el)
        store << el
        self
    end

    def pop
        store.shift
    end

    def peek
        store.first
    end

    private
    attr_reader :store
end