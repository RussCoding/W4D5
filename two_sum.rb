def bad_two_sum?(arr, target_sum)
    pairs = []
    arr.each_with_index do |num, i| # O(n)
        arr.each_with_index do |num, j| # O(n)
            pairs << [arr[i], arr[j]] if j > i # O(1)
        end
    end
    pairs.any? {|pair| pair.sum == target_sum} # O(n)
end # O(n) * O(n) + O(n) => O(n^2)

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false

def ok_two_sum?(arr, target_sum)
    sorted = arr.sort
    i = 0
    while i < arr.length - 1
        return true if sorted[i] + sorted[i + 1] == target_sum
        i += 1
    end
    false
end

arr = [0, 1, 5, 7]
p ok_two_sum?(arr, 6) # => should be true
p ok_two_sum?(arr, 10)

