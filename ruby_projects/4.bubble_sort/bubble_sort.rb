def bubble_sort (arr)
    sorted = false 
    while sorted==false do 
      i = 0 
      sorted = true 
      while i < (arr.length - 1) 
        if arr[i] > arr[i + 1] 
          temp=arr[i] 
          arr[i]=arr[i+1] 
          arr[i+1]=temp 
          sorted = false 
        end 
        i=i+1 
      end 
    end
    print arr 
  end
  
  bubble_sort([4,3,78,2,0,2])