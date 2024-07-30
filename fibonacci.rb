require 'benchmark'

def fibs(n)
  array = [0, 1]
  (n - 2).times do
    array << array[-1] + array[-2]
  end
  array
end

def fibs_rec(n)
  return [0] if n == 1
  return [0, 1] if n == 2

  prev_sequence = fibs_rec(n - 1)
  prev_sequence + [prev_sequence[-1] + prev_sequence[-2]]
end

def fibs_memo(n)
  memo = { 0 => 0, 1 => 1 }
  (2...n).each do |i|
    memo[i] = memo[i - 1] + memo[i - 2]
  end
  memo.values.take(n)
end

def print_benchmark(label, time)
  puts label
  puts "User CPU time  : #{time.utime}"
  puts "System CPU time: #{time.stime}"
  puts "Total CPU time : #{time.total}"
  puts "Real time      : #{time.real}"
  puts
end

n = 1_000

print_benchmark('Iterative:',  Benchmark.measure { fibs(n) })
print_benchmark('Recursive:',  Benchmark.measure { fibs_rec(n) })
print_benchmark('Memoization:', Benchmark.measure { fibs_memo(n) })
