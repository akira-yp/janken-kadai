class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.to_i
    while true
      if input_hand == 0 || input_hand ==1 || input_hand == 2
        return input_hand
      else
        puts "0~2を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.to_i
      end
    end
  end
end

class Enemy
  def hand
    return Random.rand(2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
    versus_calc = (player_hand - enemy_hand + 3) % 3
    if versus_calc == 2
      puts "あなたの勝ちです。"
      return false
    elsif versus_calc == 1
      puts "あなたの負けです。"
      return false
    else
      puts "あいこです。"
      return true
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new
next_game = true
while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end

## クラスとインスタンスを使わない場合のプログラム

# puts "数字を入力してください。"
# puts "0:グー, 1:チョキ, 2:パー"
# player_hand = gets.to_i
# puts player_hand
# hands = ["グー","チョキ","パー"]
# enemy_hand = Random.rand(2)
#
# if player_hand >= 0 && player_hand <= 2
#   versus_calc = (player_hand - enemy_hand + 3) % 3
# else
#   puts "無効な手です。0~2を入力してください"
# end
#
# if versus_calc == 2
#   result_message = "あなたの勝ちです。"
# elsif versus_calc == 1
#   result_message = "あなたの負けです。"
# else
#   result_message = "引き分けです。"
# end
#
# puts "相手の出した手は#{hands[enemy_hand]}です。#{result_message}"
