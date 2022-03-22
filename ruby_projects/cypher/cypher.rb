def cypher(str, nbr)
    arr = str.codepoints
    for i in 0..arr.length-1
      if arr[i].between?(65,90)
        
        if arr[i] + nbr > 90
          rest = (arr[i] + nbr)-91
          arr[i] = (65 + rest).chr
        else
          arr[i] = (arr[i] + nbr).chr
        end  
        
      elsif arr[i].between?(97,122)
        
        if arr[i] + nbr > 122
          rest = (arr[i] + nbr)-123
          arr[i] = (97 + rest).chr
        else
          arr[i] = (arr[i] + nbr).chr
        end
        
      else
        
        arr[i] = arr[i].chr
        
      end
    end
    puts arr.join("")
end