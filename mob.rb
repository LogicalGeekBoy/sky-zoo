class Mob
  def initialize(row)
    @row = row
  end

  def render(index, renderer)
    @index = index

    renderer.result(binding)
  end

  def name
    row[:name]
  end

  def id
    name.downcase.tr(" ", "_")
  end

  def icon
    row[:icon]
  end

  def texture
    row[:texture]
  end

  def trade_buy_item
    row[:trade_buy_item]
  end

  def trade_buy_amount
    row[:trade_buy_amount]
  end

  def trade_sell_item
    row[:trade_sell_item]
  end

  def trade_sell_amount
    row[:trade_sell_amount]
  end

  def minecraft_id
    row[:id]
  end

  def nbt
    row[:nbt]
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
end
