class EmojiService
  class << self


    def hasNoms?(str)
      @@names.keys.each{|x| return @@names[x] if str.include?(x)}
      false
    end

    def convert?(str)
      @@u16.keys.each{|x| return @@u16[x] if str == x}
      false
    end

    def names
      return @@names
    end

    def u16
      return @@u16
    end


    @@names ={
      #"\u{1F435}" => "monkey face",
      "\u{1F34E}" => "red apple",
      "\u{1F34F}" => "green apple",
      "\u{1F351}" => "peach",
      "\u{1F352}" => "cherries",
      "\u{1F353}" => "strawberry",
      "\u{1F34D}" => "pineapple",
      "\u{1F34C}" => "banana",
      "\u{1F34A}" => "tangerine",
      "\u{1F349}" => "watermelon",
      "\u{1F348}" => "melon",
      "\u{1F347}" => "grapes",
      "\u{1F346}" => "aubergine",
      "\u{1F345}" => "tomato",
      "\u{1F344}" => "mushroom",
      "\u{1F354}" => "burger",
      "\u{1F355}" => "pizza",
      "\u{1F356}" => "meat on bone",
      "\u{1F357}" => "poultry leg",
      "\u{1F358}" => "rice cracker",
      "\u{1F359}" => "rice ball",
      "\u{1F35A}" => "cooked rice",
      "\u{1F35B}" => "curry and rice",
      "\u{1F35C}" => "steaming bowl",
      "\u{1F35D}" => "spaghetti",
      "\u{1F35E}" => "bread",
      "\u{1F35F}" => "french fries",
      "\u{1F360}" => "roasted sweet potato",
      "\u{1F361}" => "dango",
      "\u{1F362}" => "oden",
      "\u{1F363}" => "sushi",
      "\u{1F364}" => "fried shrimps",
      "\u{1F365}" => "fish cake with swirl design",
      "\u{1F366}" => "soft ice cream",
      "\u{1F367}" => "shaved ice",
      "\u{1F368}" => "ice cream",
      "\u{1F369}" => "doughnut",
      "\u{1F36A}" => "cookie",
      "\u{1F36B}" => "chocolate bar",
      "\u{1F36C}" => "candy",
      "\u{1F36D}" => "lollipop",
      "\u{1F36E}" => "custard",
      "\u{1F36F}" => "honey pot",
      "\u{1F370}" => "shortcake",
      "\u{1F371}" => "bento box",
      "\u{1F372}" => "pot of food",
      "\u{1F373}" => "cooking",
      "\u{1F374}" => "fork and knife",
      "\u{1F375}" => "teacup without handle",
      "\u{1F376}" => "sake bottle and cup",
      "\u{1F377}" => "wine and glass",
      "\u{1F378}" => "cocktail glass",
      "\u{1F379}" => "tropical drink",
      "\u{1F37A}" => "beer mug",
      "\u{1F37B}" => "clinking beer mug",
      "\u{1F382}" => "birthday cake",
      "\u{1F41F}" => "fish",
      "\u{1F437}" => "pig face",
      "\u{1F330}" => "chestnut",
      "\u{1F33D}" => "ear of maize",
      "\u{1F40C}" => "snail",
      "\u{1F419}" => "squid",
      "\u{1F438}" => "frog face",
      "\u{1F52A}" => "hocho",
      "\u{1F44D}" => "thumbs up sign"
    }

    @@u16 = {
      #"\ud83d\udc35" => "monkey face",
      "\ud83c\udf4e" => "red apple",
      "\ud83c\udf4f" => "green apple",
      "\ud83c\udf51" => "peach",
      "\ud83c\udf52" => "cherries",
      "\ud83c\udf53" => "strawberry",
      "\ud83c\udf4d" => "pineapple",
      "\ud83c\udf4c" => "banana",
      "\ud83c\udf4a" => "tangerine",
      "\ud83c\udf49" => "watermelon",
      "\ud83c\udf48" => "melon",
      "\ud83c\udf47" => "grapes",
      "\ud83c\udf46" => "aubergine",
      "\ud83c\udf45" => "tomato",
      "\ud83c\udf44" => "mushroom",
      "\ud83c\udf54" => "burger",
      "\ud83c\udf55" => "pizza",
      "\ud83c\udf56" => "meat on bone",
      "\ud83c\udf57" => "poultry leg",
      "\ud83c\udf58" => "rice cracker",
      "\ud83c\udf59" => "rice ball",
      "\ud83c\udf5a" => "cooked rice",
      "\ud83c\udf5b" => "curry and rice",
      "\ud83c\udf5c" => "steaming bowl",
      "\ud83c\udf5d" => "spaghetti",
      "\ud83c\udf5e" => "bread",
      "\ud83c\udf5f" => "french fries",
      "\ud83c\udf60" => "roasted sweet potato",
      "\ud83c\udf61" => "dango",
      "\ud83c\udf62" => "oden",
      "\ud83c\udf63" => "sushi",
      "\ud83c\udf64" => "fried shrimps",
      "\ud83c\udf65" => "fish cake with swirl design",
      "\ud83c\udf66" => "soft ice cream",
      "\ud83c\udf67" => "shaved ice",
      "\ud83c\udf68" => "ice cream",
      "\ud83c\udf69" => "doughnut",
      "\ud83c\udf6a" => "cookie",
      "\ud83c\udf6b" => "chocolate bar",
      "\ud83c\udf6c" => "candy",
      "\ud83c\udf6d" => "lollipop",
      "\ud83c\udf6e" => "custard",
      "\ud83c\udf6f" => "honey pot",
      "\ud83c\udf70" => "shortcake",
      "\ud83c\udf71" => "bento box",
      "\ud83c\udf72" => "pot of food",
      "\ud83c\udf73" => "cooking",
      "\ud83c\udf74" => "fork and knife",
      "\ud83c\udf75" => "teacup without handle",
      "\ud83c\udf76" => "sake bottle and cup",
      "\ud83c\udf77" => "wine and glass",
      "\ud83c\udf78" => "cocktail glass",
      "\ud83c\udf79" => "tropical drink",
      "\ud83c\udf7a" => "beer mug",
      "\ud83c\udf7b" => "clinking beer mug",
      "\ud83c\udf82" => "birthday cake",
      "\ud83d\udc1f" => "fish",
      "\ud83d\udc37" => "pig face",
      "\ud83c\udf30" => "chestnut",
      "\ud83c\udf3d" => "ear of maize",
      "\ud83d\udc0c" => "snail",
      "\ud83d\udc19" => "squid",
      "\ud83d\udc38" => "frog face",
      "\ud83d\udd2a" => "hocho",
      "\ud83d\udc4d" => "thumbs up sign"
    }

  end
end