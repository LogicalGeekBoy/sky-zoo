require "erb"
require "fileutils"
require "zip"
require "./mob_list"

class Generator
  BUILD_OUTPUT_PATH = "./build/sky-zoo.zip"

  def initialize
    @advancement_renderer = ERB.new(File.read("./templates/advancement.json.erb"))
    @reward_renderer = ERB.new(File.read("./templates/reward.mcfunction.erb"))
    @trigger_renderer = ERB.new(File.read("./templates/trigger.mcfunction.erb"))
    @trade_renderer = ERB.new(File.read("./templates/trade.mcfunction.erb"))
    @clock_renderer = ERB.new(File.read("./templates/clock.mcfunction.erb"))
    @remove_reward_renderer = ERB.new(File.read("./templates/remove_reward.mcfunction.erb"))
  end

  def generate
    clean_files
    generate_pack
    zip_pack
  end

  private

  attr_reader :advancement_renderer, :reward_renderer, :trigger_renderer, :trade_renderer, :clock_renderer, :remove_reward_renderer

  def generate_pack
    open_files do |clock_file, trades_file, remove_rewards_file|
      generate_files(clock_file, trades_file, remove_rewards_file)
    end
  end

  def generate_files(clock_file, trades_file, remove_rewards_file)
    mobs.each_with_index do |mob, index|
      advancement = mob.render(index, advancement_renderer)
      reward = mob.render(index, reward_renderer)
      trigger = mob.render(index, trigger_renderer)
      trade = mob.render(index, trade_renderer)
      remove_reward = mob.render(index, remove_reward_renderer)

      File.write("./data/sky_zoo/advancements/capture_#{mob.id}.json", advancement)
      File.write("./data/sky_zoo/functions/rewards/#{mob.id}_reward.mcfunction", reward)

      clock_file.puts(trigger)
      trades_file.puts(trade)
      remove_rewards_file.puts(remove_reward)
    end

    write_clock_commands(clock_file)
  end

  def write_clock_commands(clock_file)
    commands = mobs.render(clock_renderer)
    clock_file.puts(commands)
  end

  def open_files
    clock_file = File.open("./data/sky_zoo/functions/clock.mcfunction", "w")
    trades_file = File.open("./data/sky_zoo/functions/zookeeper_trades.mcfunction", "w")
    remove_rewards_file = File.open("./data/sky_zoo/functions/remove_rewards.mcfunction", "w")

    yield(clock_file, trades_file, remove_rewards_file)

    clock_file.close
    trades_file.close
    remove_rewards_file.close
  end

  def mobs
    @mobs ||= MobList.new("./mobs.csv")
  end

  def clean_files
    FileUtils.rm(Dir.glob("./data/sky_zoo/advancements/capture_*.json"))
    FileUtils.rm(Dir.glob("./data/sky_zoo/functions/rewards/*_reward.mcfunction"))
    FileUtils.rm(BUILD_OUTPUT_PATH, :force => true)
  end

  def zip_pack
    files = ['pack.mcmeta', 'LICENCE.md', 'README.md'].concat(Dir.glob('data/**/*'))

    Zip::File.open(BUILD_OUTPUT_PATH, Zip::File::CREATE) do |zip_file|
      files.each do |file|
        zip_file.add(file, file)
      end
    end
  end
end
