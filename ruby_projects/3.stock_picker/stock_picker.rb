def stock_picker(arr)
    buy=[]
    sell=[]
    result=[]
    arr.each_with_index do |price, index|
      if index < arr.length/2
        buy.push(arr[index])
      else if index >= arr.length/2 && index < arr.length
        sell.push(arr[index])
      end
    end
  end
    result.push(arr.index(buy.min))
    result.push(arr.index(sell.max))
    print result
  end
  
  stock_picker([17,3,6,9,15,8,6,1,10])