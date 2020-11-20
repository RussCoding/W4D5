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
    arr1.each do |char|
       arr2.delete_at(arr2.index(char)) if arr2.include?(char)
    end
    arr2.empty?
end

a = "abc"
b = "cba"
p anagrams2(a,b)