# The Enumerable Module contains some usefull methods for functional programming
#
# Zip
# zip [1, 2, 3, 4] [5, 6, 7, 8]
p [1, 2, 3, 4].zip([5, 6, 7, 8])
p [1, 2, 3, 4].zip([5, 6, 7, 8], [9, 10, 11, 12])

# Select / Find all / Filter
# isEven n = n `mod` 2 == 0
# filter isEven [1, 2, 3, 4]
#
# filter (\n -> n `mod` 2 == 0) [1, 2, 3, 4]
p [1, 2, 3, 4].select { |x| x.even? }
p [1, 2, 3, 4].select(&:even?)
p [1, 2, 3, 4].find_all { |x| x.even? }

# Partition
# isEven n = n `mod` 2 == 0
# partition isEven [1, 2, 3, 4]
#
# partition (\n -> n `mod` 2 == 0) [1, 2, 3, 4]
p [1, 2, 3, 4].partition { |x| x.even? }
p [1, 2, 3, 4].partition(&:even?)

# Map / Collect
# map (\n -> succ n) [1, 2, 3, 4]
p [1, 2, 3, 4].map { |x| x.succ }
p [1, 2, 3, 4].map(&:succ)
p [1, 2, 3, 4].collect { |x| x.succ }

# Inject / Reduce
# foldl (\acc x -> acc + x) 0 [1, 2, 3, 4]
p [1, 2, 3, 4].inject(0) { |a, e| a + e }
p [1, 2, 3, 4].reduce(0) { |a, e| a + e }


# Practical Example
def count_mines_near(x, y)
  count = 0
  for i in x-1..x+1
    for j in y-1..y+1
      count += 1 if mine_at?(i, j)
    end
  end

  count
end

count_mines_near(2, 8)
# With functional enumerable methods
def count_mines_near(x, y)
  ((x-1..x+1).entries * 3).sort.
    zip((y-1..y+1).entries * 3).
    select { |x,y| mine_at?(x, y) }.
    count
end


