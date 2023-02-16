def sum_to(n)
    return if n < 0
    return 0 if n == 0
    n + sum_to(n - 1)
end

def add_numbers(arr)
    return if arr.length < 1
    return arr[0] if arr.length == 1

    arr[0] + add_numbers(arr[1 ... arr.length])
end

def gamma_function(n)
    return if n < 1
    return 1 if n == 1

    (n - 1) * gamma_function(n - 1)
end

def ice_cream_shop(arr, fav)
    return false if arr.length == 0

    arr[0] == fav || ice_cream_shop(arr[1 ... arr.length], fav)
end

def reverse(str)
    return "" if str.length == 0

    reverse(str[1 ... str.length]) + str[0]
end