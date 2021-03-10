# Prompts the user for two integers.
# - The first one should be between 1 and 4, with
#   * 1 meaning initially looking North,
#   * 2 meaning initially looking East,
#   * 3 meaning initially looking South,
#   * 4 meaning initially looking West.
# - The second one should be positive. When written in base 3, its consecutive
#   digits read from left to right represent the directions to take, with
#   * 0 meaning going in the direction one is initially looking at,
#   * 1 meaning 45 degrees left of the direction one is initially looking at,
#   * 2 meaning 45 degrees right of the direction one is initially looking at.
#
# Prints out:
# - the direction one is originally looking at, as an arrow,
# - the representation of the second digit in base 3,
# - the corresponding sequence of directions to take, as arrows,
# - in case one is originally looking North or South, the path,
#   so the sequence of arrows again, but nicely displayed.
# - you may use the unicode array for output: ['↑', '↗', '→', '↘', '↓', '↙', '←', '↖']


begin
    print('Enter an integer between 1 and 4 and a positive integer: ')
    initial_direction, directions = gets.split()
    if initial_direction.size != 1 || directions.size > 1 && directions[0] == '0'
        raise ArgumentError
    end

    initial_direction = initial_direction.to_i
    directions = directions.to_i
    if ![1, 2, 3, 4].include?(initial_direction) || directions < 0
        raise ArgumentError
    end

# 以下為作答區-------

#箭頭方向判斷
init_dir = initial_direction
    
    if init_dir == 1
          init_arrow = "↑"
    elsif init_dir == 2
          init_arrow = "→"
    elsif init_dir == 3
          init_arrow = "↓"
    else  init_dir == 4
          init_arrow = "←"
    end
               
    puts("OK! You want to first look this way:#{init_arrow}")

    directions_base3 = directions.to_s(base=3)
    puts("In base 3 the Second Input reads as:#{directions_base3}")
    #directions轉三進位
    # In base 3 the Second Input reads as:2222
  
# 判斷:當箭頭指向南北時，其他箭頭統一向上或向下  
# -------
      if    init_arrow == '↑'
            arrow_1 = "↖"
            arrow_2 = "↗"
      elsif init_arrow == '→'
            arrow_1 = "↗"
            arrow_2 = "↘"  
      elsif init_arrow  == '↓'
            arrow_1 = "↘"
            arrow_2 = "↙"
      elsif init_arrow  == '←'
            arrow_1 = "↙"
            arrow_2 = "↖"
      end
# -------
 space = " "

    base3_step = directions_base3.split(//)
    base3_step_arrow = []
    base3_step.each do |num|
        if num == "0"
            arrow = init_arrow   
        elsif num == "1"
            arrow = arrow_1
        elsif num == "2" 
            arrow = arrow_2
        end
        base3_step_arrow << arrow 
        end

    puts "So that's how you want to go: #{base3_step_arrow.join}"
      
    ans_2 = ("I don't want to have the sun in my eyes, but by all means have a go at it!") 

# 判斷: initial_direction為1,3 印出足跡，2,4印出英文句子
   
    if init_dir == 1 || 3
        puts "Let's go then! " 
        ans_1 = 
        for move in base3_step_arrow
        puts move 
        end
    else init_dir == 2 || 4
        puts ans_2 
    end


      
   
# 以上為作答區-------
rescue ArgumentError => e
    print("Incorrect input, giving up.\n")
    exit
 
end




