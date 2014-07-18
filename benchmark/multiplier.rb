require 'benchmark'

# NOTE THIS: YOU SHOULD TWEAK IT IN ORDER TO HAVE BENCHMARKS OF ~ 10 SECONDS
multiplier = 5_000_000
pairs = [{name: "firstname", value: "string"},{name: "lastname", value: "string"},{name: "country", value: "string"},{name: "city", value: "string"},{name: "state", value: "string"},{name: "company", value: "string"},{name: "year", value: "string"},{name: "political_affiliation", value: "string"},{name: "social_security_number", value: "string"}] * multiplier
blank = {}

puts Benchmark.measure {
  pairs.each do |pair|
    blank[pair[:name]] = pair[:value]
  end
}
