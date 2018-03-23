# Write a method called `scrabble_score` which should accept a string as a parameter and return the amount of points it is worth in Scrabble. You can use the following hash to determine how many points each letter is worth:
# ```points = {'a'=> 1, 'b'=> 3, 'c'=> 3, 'd'=> 2, 'e'=> 1, 'f'=> 4, 'g'=> 2, 'h'=> 4, 'i'=> 1, 'j'=> 8, 'k'=> 5, 'l'=> 1, 'm'=> 3, 'n'=> 1, 'o'=> 1, 'p'=> 3, 'q'=> 10, 'r'=> 1, 's'=> 1, 't'=> 1, 'u'=> 1, 'v'=> 4, 'w'=> 4, 'x'=> 8, 'y'=> 4, 'z'=> 10}```
# Use the `reduce` method to perform the computation in your scrabble_score method. The code should work as follows:
# ```p scrabble_score("scholar")  #=> 12```
points = {'a'=> 1, 
  'b'=> 3, 
  'c'=> 3, 
  'd'=> 2, 
  'e'=> 1, 
  'f'=> 4, 
  'g'=> 2, 
  'h'=> 4, 
  'i'=> 1, 
  'j'=> 8, 
  'k'=> 5, 
  'l'=> 1, 
  'm'=> 3, 
  'n'=> 1, 
  'o'=> 1, 
  'p'=> 3, 
  'q'=> 10, 
  'r'=> 1, 
  's'=> 1, 
  't'=> 1, 
  'u'=> 1, 
  'v'=> 4, 
  'w'=> 4, 
  'x'=> 8, 
  'y'=> 4, 
  'z'=> 10}

def scrabble_score(word)
  word.each_char do |x|
    p x
  end
end

scrabble_score("scholar") 
