
def my_min(list) #
    list.select do |ele|
        list.all? {|ele2| ele2 >= ele}
    end.pop
end

def my_min2(list) #Time complexity is O(n)
    list.inject {|acc, ele|  ele < acc ? ele : acc}
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5
p my_min2(list)


