require "csv"
require "./mob"

class MobList
  def initialize(csv_path)
    @csv_path = csv_path

    load
  end

  def each_with_index
    mobs.each_with_index do |mob, index|
      yield(mob, index)
    end
  end

  def render(renderer)
    renderer.result(binding)
  end

  def all_advancement_conditions
    mobs.map { |mob| "sky_zoo:capture_#{mob.id}=true" }.join(",")
  end

  private

  attr_reader :csv_path, :mobs

  def load
    @mobs = CSV.open(csv_path, headers: true, header_converters: :symbol).map do |row|
      Mob.new(row)
    end.sort_by(&:name)
  end
end
