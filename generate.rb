require "erb"
require "csv"
require "securerandom"
require "fileutils"
require "zip"
require "./mob"

class Generator
  BUILD_OUTPUT_PATH = "./build/sky-zoo.zip"

  def initialize
    @advancement_renderer = ERB.new(File.read("./templates/advancement.json.erb"))
    @reward_renderer = ERB.new(File.read("./templates/reward.mcfunction.erb"))
    @trigger_renderer = ERB.new(File.read("./templates/trigger.mcfunction.erb"))
    @trade_renderer = ERB.new(File.read("./templates/trade.mcfunction.erb"))
  end

  def generate
    clean_files
    generate_pack
    zip_pack
  end

  private

  attr_reader :advancement_renderer, :reward_renderer, :trigger_renderer, :trade_renderer

  def generate_pack
    open_files do |clock_file, trades_file|
      generate_files(clock_file, trades_file)
    end
  end

  def generate_files(clock_file, trades_file)
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
  end

  def open_files
    clock_file = File.open("./data/sky_zoo/functions/clock.mcfunction", "w")
    trades_file = File.open("./data/sky_zoo/functions/zookeeper_trades.mcfunction", "w")

    yield(clock_file, trades_file)

    clock_file.close
    trades_file.close
  end

  def mobs
    @mobs ||= CSV.open("./mobs.csv", headers: true, header_converters: :symbol).map do |row|
      Mob.new(row)
    end
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

Generator.new.generate
