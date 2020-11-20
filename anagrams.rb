def anagrams1(str1,str2)
    anags = str1.chars.permutation.to_a #O(n!)
    #anags.include?(str2.split(""))
    anags.map {|word| word.join("")}.include?(str2) #O(n!) + O(n!)
end  
# a = "abc"
# b = "cba"
# p anagrams1(a,b)

def anagrams2(str1,str2)
    arr1 = str1.chars
    arr2 = str2.chars
    arr1.each do |char| #O(n)
       arr2.delete_at(arr2.index(char)) if arr2.include?(char) # O(m)
    end
    arr2.empty? # O(m) 
end # => O(n) * O(m) + O(m) => O(n*m)

# a = "abc"
# b = "cba"
# p anagrams2(a,b)

def anagrams3(str1, str2)
    sort1 = str1.chars.sort # O(nlogn)
    sort2 = str2.chars.sort # O(mlogm)
    sort1 == sort2
end # O(nlogn) + O(mlogm) => O(nlogn + mlogm) || O(n^2) + O(m^2)

# a = "abc"
# b = "cbd"
# p anagrams3(a,b)

def anagrams4(str1, str2)
    hash1 = Hash.new(0) 
    hash2 = Hash.new(0)
    str1.each_char {|char| hash1[char] += 1} # O(n)
    str2.each_char {|char| hash2[char] += 1} # O(m)
    hash1 == hash2
end # O(n) + O(m) => O(n + m)

# a = "abc"
# b = "cbd"
# p anagrams4(a,b)

def anagrams5(str1, str2)
    hash = Hash.new(0) 
    str1.each_char {|char| hash[char] += 1} # O(n)
    str2.each_char {|char| hash[char] -= 1} # O(m)
    hash.all? {|k, v| v.zero? } # O(n) * O(1) => O(n)
end # O(n) + O(m) + O(n) => O(n + m)

a = "abc"
b = "cbd"
p anagrams5(a,b)