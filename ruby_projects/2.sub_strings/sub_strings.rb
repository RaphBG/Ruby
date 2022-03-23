def sub_string(str, dictionary)
    arr = str.split
    result = Hash.new 0
    dictionary.map do |dictionary_word|
      arr.map do |word|
        if word.include?(dictionary_word)
          result[dictionary_word] += 1
        end
      end
    end
      print result
  end
  
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  
  sub_string("Howdy partner, sit down! How's it going?",dictionary)