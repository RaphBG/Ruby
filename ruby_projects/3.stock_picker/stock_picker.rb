def stock_picker(arr)
  buy=[]
  sell=[]
  result=[]
  arr.each_with_index do |price, index|
    if index < arr.length/2
      buy.push(arr[index])
    elsif index >= arr.length/2 && index < arr.length
      sell.push(arr[index])
    end
  end
  result.push(arr.index(buy.min))
  result.push(arr.index(sell.max))
  print result
end
  
stock_picker([17,3,6,9,15,8,6,1,10])

# def stock_picker(array)
#   hash = array.each_with_object({}).with_index do |(buy_value, hash), buy_index|
#     best_sell_index = nil
#     best_profit = nil

#     array.each_with_index do |sell_value, sell_index|
#       next if buy_index >= sell_index
#       profit = sell_value - buy_value
#       next if best_profit && profit <= best_profit

#       best_sell_index = sell_index
#       best_profit = profit
#     end

#     if best_profit
#       hash[best_profit] = [buy_index, best_sell_index]
#     end
#   end

#   print hash.max[1]
# end