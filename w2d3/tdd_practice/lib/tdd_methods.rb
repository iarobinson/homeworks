
class Array

  def my_unique
    uniques = []

    self.each do |x|
      uniques << x unless uniques.include?(x)
    end

    uniques
  end

  def two_sum
    indexes = []

    # each_with_index do |x, idx1|
    #   idx2 = idx1 + 1
    #   while idx2 < length
    #     if self[idx1] + self[idx2] == 0
    #       indexes << [idx1, idx2]
    #     end
    #
    #     idx2 += 1
    #   end
    # end
    #
    # indexes

    (length - 1).times do |i|
      (i + 1..length - 1).to_a.each_with_index do |j|
        indexes << [i, j] if self[i] + self[j] == 0
      end
    end

    indexes
  end

  def my_transpose
    transposed = Array.new(self.length) { [] }

    each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        transposed[col_idx] << el
      end
    end

    transposed
  end
end

def stock_picker(stocks)
  best_days = nil
  best_trade = 0

  (stocks.length - 1).times do |initial_day|
    (initial_day + 1..stocks.length - 1).to_a.each do |sell_day|
      price_diff = stocks[sell_day] - stocks[initial_day]
      if price_diff > best_trade
        best_trade = price_diff
        best_days = [initial_day, sell_day]
      end
    end
  end

  best_days
end
