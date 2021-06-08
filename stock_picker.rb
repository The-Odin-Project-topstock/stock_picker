#> stock_picker([17,3,6,9,15,8,6,1,10])  the array is the dollar value.
#=> [1,4]  # for a profit of $15 - $3 == $12
#[buy_day, sell_day]
prices = [17,3,6,9,15,8,6,1,10]

#track the days of the maximum difference while calculating
  #differences for the entire array

def stock_picker ( prices )
  gains = Array.new( prices.length ) # buy date is index of each array + 1 
  sell_dates = Array.new( prices.length ) # best day to sell
  diffs = Array.new( prices.length )

  prices_sub = [Array.new(1) { prices }].flatten #prices to #shift

  x = 0
  while x < prices.length
    diffs = prices_sub.map { |v| v - prices[x] } 
    sell_dates[x] = x + diffs.index(diffs.max) #day(x + 1) + days until sell date
    gains[x] = diffs.max # best sale price for these dates
    prices_sub.shift
    x = x + 1
  end
   buy_date = gains.index(gains.max)
   sell_date = sell_dates[buy_date] #sell dates as well
   [buy_date, sell_date]
end
p stock_picker(prices)
 