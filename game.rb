require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multi, last_played)
    @last_played_at = last_played
    @multiplayer = multi
  end

  private

  def can_be_archived?
    return true if super() && ((Date.today - Date.parse(@last_played_at)).to_i / 365 >= 2)

    false
  end
end
