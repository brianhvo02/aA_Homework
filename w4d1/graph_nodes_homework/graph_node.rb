class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end    
end

def bfs(starting_node, target_value)
    node_queue = [ starting_node ]
    nodes_traversed = []

    until node_queue.empty?
        node = node_queue.shift
        return node if node.value == target_value
        nodes_traversed << node
        node_queue.concat(node.neighbors.select { |neightbor| !nodes_traversed.include?(neightbor) })
    end

    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "f")