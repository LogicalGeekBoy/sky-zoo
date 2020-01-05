require "securerandom"

class Mob
  def initialize(row)
    @row = row
  end

  def render(index, renderer)
    @index = index

    renderer.result(binding)
  end

  def name
    field(:name)
  end

  def icon
    field(:icon)
  end

  def texture
    field(:texture)
  end

  def trade_buy_item
    field(:trade_buy_item)
  end

  def trade_buy_amount
    field(:trade_buy_amount)
  end

  def trade_sell_item
    field(:trade_sell_item)
  end

  def trade_sell_amount
    field(:trade_sell_amount)
  end

  def trade_sell_name
    return "Captured" if trade_sell_item == "name_tag"

    trade
  end

  def minecraft_id
    field(:id)
  end

  def nbt
    field(:nbt)
  end

  def dimension
    field(:dimension)
  end

  def id
    name.downcase.tr(" ", "_")
  end

  def conditional
    return "" if field(:conditional) == ""

    "#{field(:conditional)} "
  end

  def trade
    return "TNT" if trade_sell_item == "tnt"

    trade_sell_item.split("_").map(&:capitalize).join(" ")
  end

  def owner_id
    SecureRandom.uuid
  end

  def custom_mob_head?
    icon == "player_head"
  end

  def max_uses
    99_999
  end

  private

  attr_reader :row, :index

  def field(header)
    row[header]&.strip || ""
  end
end
