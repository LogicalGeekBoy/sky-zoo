require "erb"
require "csv"
require "securerandom"
require "./mob"

advancement_renderer = ERB.new(File.read("./templates/advancement.json.erb"))
reward_renderer = ERB.new(File.read("./templates/reward.mcfunction.erb"))
trigger_renderer = ERB.new(File.read("./templates/trigger.mcfunction.erb"))
trade_renderer = ERB.new(File.read("./templates/trade.mcfunction.erb"))

mobs = CSV.open("./mobs.csv", headers: true, header_converters: :symbol).map do |row|
  Mob.new(row)
end

clock_file = File.open("./data/sky_zoo/functions/clock.mcfunction", "w")
trades_file = File.open("./data/sky_zoo/functions/zookeeper_trades.mcfunction", "w")

mobs.sort_by(&:name).each_with_index do |mob, index|
  advancement = mob.render(index, advancement_renderer)
  reward = mob.render(index, reward_renderer)
  trigger = mob.render(index, trigger_renderer)
  trade = mob.render(index, trade_renderer)

  File.write("./data/sky_zoo/advancements/capture_#{mob.id}.json", advancement)
  File.write("./data/sky_zoo/functions/rewards/#{mob.id}_reward.mcfunction", reward)

  clock_file.puts(trigger)
  trades_file.puts(trade)
end

clock_file.close
trades_file.close
