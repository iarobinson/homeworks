require "rspec"
require "towers_of_hanoi"

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe "#initialize" do
    it "initializes with plates in first row" do
      board = [[3, 2, 1], [], []]

      expect(game.board).to eq(board)
    end
  end

  describe "#valid_move?" do
    context "when move is valid" do
      it "responds true when moving a plate to an empty row" do
        expect(game.valid_move?([0, 1])).to be true
        expect(game.valid_move?([0, 2])).to be true
      end

      it "responds true when moving a smaller plate onto a larger plate" do
        game.board = [[2, 1], [3], []]

        expect(game.valid_move?([0, 1])).to be true
        expect(game.valid_move?([0, 2])).to be true
      end
    end

    context "when move is invalid" do
      it "responds false if first position is empty" do
        expect(game.valid_move?([1, 0])).to be false
        expect(game.valid_move?([2, 0])).to be false
      end

      it "responds false when moving a larger plate onto a smaller plate" do
        game.board = [[2, 1], [3], []]

        expect(game.valid_move?([1, 0])).to be false
      end
    end
  end

  describe "#won?" do
    it "celebrates victory when second or third rows are full" do
      game.board = [[], [3, 2, 1], []]
      expect(game.won?).to be true

      game.board = [[], [], [3, 2, 1]]
      expect(game.won?).to be true
    end

    it "doesn't cellebrate premature victory due to first row being empty" do
      game.board = [[], [3, 2], [1]]

      expect(game.won?).to be false
    end
  end

  describe "#make_move" do
    it "move plate from one row to another" do
      game.make_move([0, 1])

      expect(game.board[0]).to_not include(1)
      expect(game.board[1]).to include(1)
    end
  end
end
