class Player
  def hand
    puts "数字を入力してください。"
    while true
      puts "0:グー, 1:チョキ, 2:パー"
      input_hand = gets.chomp
      h = input_hand.to_i
      if input_hand =~ /([0-2])/ && ( h == 0 || h ==1 || h == 2 )
        return h
      else
        puts "無効な値です。0~2を入力してください。"
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
