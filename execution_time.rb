
def my_min(list) #
    list.select do |ele| # O(n)
        list.all? {|ele2| ele2 >= ele} # O(n)
    end.pop # O(1)
end # => O(n) * O(n) + O(1) => O(n^2)

def my_min2(list) #Time complexity is O(n)
    list.inject {|acc, ele|  ele < acc ? ele : acc}
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5
# p my_min2(list)


def subsum(list) 
    subs = []
    list.each_with_index do |el, i| #O(n)
        list.each_with_index do |el2, j| #O(n)
            subs << list[i..j] if j >= i #O(n)
        end
    end # => O(n^3)
    # O(n^2)
    subs.map{|sub| sub.sum}.max # => O(n)
end # => O(n^3) + O(n^3) => O(n^3)

def better_subsum(list)
    largest_sum = nil # O(1)
    current_sum = nil # O(1)
    list.each_with_index do |ele, i| # O(n)
        if current_sum == nil
            current_sum = ele
            largest_sum = current_sum if largest_sum == nil
        else
            current_sum += ele
        end

        if current_sum >= largest_sum
            largest_sum = current_sum
        end

        if  ele > current_sum
            largest_sum = ele if ele > largest_sum
            current_sum = ele
        end
    end
    largest_sum # O(1)
end # => O(n) + O(1) + O(1) => O(n)

list = [5, 3, -7]
p subsum(list) # => 8
list2 = [2, 3, -6, 7, -6, 7]
# p better_subsum(list2) # => 8 (from [7, -6, 7])
list3 = [-5, -1, -3]
# p better_subsum(list3) # => -1 (from [-1])
# possible sub-sums
[5]           # => 5
[5, 3]        # => 8 --> we want this one
[5, 3, -7]    # => 1
[3]           # => 3
[3, -7]       # => -4
[-7]          # => -7