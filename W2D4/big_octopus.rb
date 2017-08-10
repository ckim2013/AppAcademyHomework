def sluggish_octopus(fishes)
  # O(n^2) which uses nested arrays or bubblesort
  res = []
  flag = false
  until flag
    flag = true
    fishes.each.with_index do |fish, i|
      next if i == fishes.length - 1
      if fish.length > fishes[i + 1].length
        fishes[i], fishes[i + 1] = fishes[i + 1], fishes[i]
        flag = false
      end
    end
  end
  fishes.last
end

def dominant_octopus(fishes)
  # O(n log n) which uses mergesort
  prc = Proc.new { |x, y| x.length <=> y.length }
  fishes.merge_sort(&prc)[-1]
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y}
    return self if length < 2
    mid_i = length / 2
    left = self[0...mid_i].merge_sort(&prc)
    right = self[mid_i..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    res = []
    until left.empty? || right.empty?
      l = left.first
      r = right.first
      if prc.call(l, r) == -1
        res << left.shift
      else
        res << right.shift
      end
    end
    res + left + right
  end
end

def clever_octopus(fishes)
  # O(n)
  longest = fishes.first
  fishes.each do |fish|
    if longest.length < fish.length
      longest = fish
    end
  end
  longest
end

def slow_dance(dir, tiles_array)
  # O(n)
  tiles_array.each.with_index do |direction, tentacle|
    return tentacle if direction == dir
  end
end

tiles_hash = {
  'up' => 0,
  'right-up' => 1,
  'right' => 2,
  'right-down' => 3,
  'down' => 4,
  'left-down' => 5,
  'left' => 6,
  'left-up' => 7
}

def fast_dance(dir, tiles_hash)
  # O(1)
  tiles_hash[dir]
end
