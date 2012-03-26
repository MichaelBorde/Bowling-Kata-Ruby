require "test/unit"
require_relative "game"

class BowlingTest < Test::Unit::TestCase
  def setup
    @game = Game.new
  end

  def test_worst_game
    20.times { @game.add_roll(0) }

    score = @game.score

    assert_equal(0, score)
  end

  def test_bad_game
    20.times { @game.add_roll(1) }

    score = @game.score

    assert_equal(20, score)
  end
  
  def test_best_game
    12.times { @game.add_roll(10) }

    score = @game.score

    assert_equal(300, score)
  end
  
  def test__spare_only_game
    21.times { @game.add_roll(5) }

    score = @game.score

    assert_equal(150, score)
  end
end