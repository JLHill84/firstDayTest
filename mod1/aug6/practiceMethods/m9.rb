foods = {"pie" => "delicious", "broccoli" => "not delicious",
    "carrots" => "not delicious", "apples" => "delicious",
    "peanut butter" => "delicious"}

foods.each do |key, value|
     if value == "delicious"
        puts key
    end
end