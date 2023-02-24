FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish
    longest_fish = nil

    FISH.each do |fish1|
        FISH.each do |fish2|
            longest_fish = fish2 if fish1.length < fish2.length
        end
    end

    longest_fish
end

def merge(left_arr, right_arr)
    merged_arr = []

    until left_arr.empty? || right_arr.empty?
        merged_arr << (left_arr.first.length <= right_arr.first.length ? left_arr.shift : right_arr.shift)
    end

    merged_arr.concat(left_arr).concat(right_arr)
end

def merge_sort(array)
    return array if array.length < 2
    mp = array.length / 2

    left_arr = merge_sort(array[0 ... mp])
    right_arr = merge_sort(array[mp .. -1])

    merge(left_arr, right_arr)
end

def dominant
    merge_sort(FISH)[-1]
end

def clever
    longest_fish = FISH[0]

    FISH.each { |fish| longest_fish = fish if fish.length > longest_fish.length }

    longest_fish
end

TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]
TILES_HASH = {
    "up" => 0, 
    "right-up" => 1, 
    "right" => 2, 
    "right-down" => 3, 
    "down" => 4, 
    "left-down" => 5, 
    "left" => 6,  
    "left-up" => 7
}

def slow_dancing(direction, tiles)
    TILES_ARRAY.each_with_index { |tile, i| return i if direction == tile }
end

def fast_dancing(direction, hash)
    TILES_HASH[direction]
end