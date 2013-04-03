def measure(num_times=1)
  return unless (num_times > 0)
  results = []
  num_times.times do
    before = Time.now
    yield
    after = Time.now
    results.push(after-before)
  end
  results.reduce(:+).to_f / results.size
end