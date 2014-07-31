require 'httpclient'
require 'json'

repos = []
days  = %w{Sunday Monday Tuesday Wednesday Thursday Friday Saturday}

times = Hash.new do |hash, key|
  hash[key] = Hash.new { |h, k| h[k] = 0 }
end

resp = HTTPClient.get('https://api.github.com/users/Benny1992/repos')

JSON(resp.body).each do |repo|
  repos << repo['name']
end

repos.each do |name|
  resp = HTTPClient.get("https://api.github.com/repos/Benny1992/#{name}/stats/punch_card")

  JSON(resp.body).each do |(day, hour, amount)|
    times[day][hour] += amount
  end
end

spacing = days.sort_by(&:length).last.length

times.each do |day_index, hours|
  day           = days[day_index]
  hour, commits = hours.sort_by { |pair| pair[1] }.last

  puts "#{day.ljust(spacing, ' ')} at #{hour.to_s.ljust(2, ' ')}: #{commits} commits"
end
