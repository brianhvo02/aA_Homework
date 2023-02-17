class Queue
    def initialize
        @store = []
    end

    def enqueue(el)
        store.unshift(el)
        self
    end

    def dequeue
        store.shift
    end

    def peek
        store.first
    end

    private
    attr_reader :store
end