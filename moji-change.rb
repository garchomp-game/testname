moji="きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます"
hash={'I'=>"い","U"=>"う"}
puts moji.gsub(/#{hash.keys.join('|')}/,hash)