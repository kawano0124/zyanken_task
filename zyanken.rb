def get_hand_input
  puts "手を選んでください: 0:グー, 1:チョキ, 2:パー"
  hand = gets.chomp.to_i
  until [0, 1, 2].include?(hand)
    puts "不正な値です。0, 1, 2のいずれかを入力してください。"
    hand = gets.chomp.to_i
  end
  hand
end

def random_hand
  rand(3)
end

def random_direction
  rand(4)
end

def hand_name(hand)
  case hand
  when 0 then "グー"
  when 1 then "チョキ"
  when 2 then "パー"
  end
end

def direction_name(direction)
  case direction
  when 0 then "上"
  when 1 then "下"
  when 2 then "左"
  when 3 then "右"
  end
end

def get_direction_input
  puts "方向を選んでください: 0:上, 1:下, 2:左, 3:右"
  direction = gets.chomp.to_i
  until [0, 1, 2, 3].include?(direction)
    puts "不正な値です。0, 1, 2, 3のいずれかを入力してください。"
    direction = gets.chomp.to_i
  end
  direction
end

def janken_result(player, opponent)
  if player == opponent
    "draw"
  elsif (player == 0 && opponent == 1) || (player == 1 && opponent == 2) || (player == 2 && opponent == 0)
    "win"
  else
    "lose"
  end
end

def attimuite_hoi_result(finger_direction, face_direction)
  finger_direction == face_direction
end

def janken
  player_hand = get_hand_input
  opponent_hand = random_hand
  puts "あなた: #{hand_name(player_hand)}, 相手: #{hand_name(opponent_hand)}"
  
  janken_result(player_hand, opponent_hand)
end

def attimuite_hoi(winner)
  if winner == "player"
    puts "あなたの勝ちです。あっち向いてホイ..."
    finger_direction = get_direction_input
    face_direction = random_direction
    puts "相手の顔の方向: #{direction_name(face_direction)}"
    if attimuite_hoi_result(finger_direction, face_direction)
      "player"
    else
      "continue"
    end
  else
    puts "あなたの負けです。あっち向いてホイ..."
    face_direction = get_direction_input
    finger_direction = random_direction
    puts "相手の指の方向: #{direction_name(finger_direction)}"
    if attimuite_hoi_result(finger_direction, face_direction)
      "opponent"
    else
      "continue"
    end
  end
end

loop do
  puts "じゃんけん..."
  result = janken
  
  if result == "draw"
    puts "あいこで..."
    next
  elsif result == "win"
    attimuite_hoi_result = attimuite_hoi("player")
    if attimuite_hoi_result == "player"
      puts "あなたの勝ちです！"
      break
    else
      puts "続けます。"
    end
  else
    attimuite_hoi_result = attimuite_hoi("opponent")
    if attimuite_hoi_result == "opponent"
      puts "相手の勝ちです！"
      break
    else
      puts "続けます。"
    end
  end
end
