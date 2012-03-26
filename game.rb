class Game
  def initialize
    @rolls = []
  end

  def add_roll(pins)
    @rolls.push(pins)
  end

  def score
    score = 0
    i = 0
    while i < @rolls.length do
      score += @rolls[i]
      if strike?(@rolls, i)
        score += @rolls[i + 1] + @rolls[i + 2]
        break if last_strike_or_spare_before_bonus?(@rolls, i)
      else
        if spare?(@rolls, i)
          score += @rolls[i + 1] + @rolls[i + 2]
          break if last_strike_or_spare_before_bonus?(@rolls, i)
        else
          score += @rolls[i + 1]
        end
        i += 1 
      end
      i += 1
    end
    score
  end
  
  private
  def strike?(rolls, i)
    rolls[i] == 10
  end
  
  def spare?(rolls, i)
    rolls[i] + rolls[i + 1] == 10
  end
  
  def last_strike_or_spare_before_bonus?(rolls, index)
    index >= rolls.length - 3
  end
end