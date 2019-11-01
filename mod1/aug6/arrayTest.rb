myArray = ["apple", "pear", "face", "champagne", "palm tree", "aardvark", "pineapple"]
myArray.each do |word|
    if word.start_with?("a")
        puts word
    end
end