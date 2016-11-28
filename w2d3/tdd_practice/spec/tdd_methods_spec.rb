require 'tdd_methods'

describe '#my_unique' do
  it "removes duplicates from an array" do
    arr = [1, 2, 1, 3, 3]
    expect(arr.my_unique).to eq([1, 2, 3])
  end
end

describe '#two_sum' do
  it "return an array of indicies whos values total to zero" do
    arr = [-1, 0, 2, -2, 1]
    expect(arr.two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe '#my_transpose' do
  it 'transposes an array' do
    rows = [
          [0, 1, 2],
          [3, 4, 5],
          [6, 7, 8]
        ]

    cols = [
          [0, 3, 6],
          [1, 4, 7],
          [2, 5, 8]
        ]

    expect(rows.my_transpose).to eq(cols)
  end
end

describe "#stock_picker" do
  it "returns array with indexes for the optimal buy sell positions" do
    stocks = [5, 4, 9, 1, 3, 2, 7]
    expect(stock_picker(stocks)).to eq([3, 6])
  end
end
