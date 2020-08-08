puts 'Hello, this game mimics an orange tree.'
puts 'Water it, watch it grow,'
puts 'harvest oranges, and try to keep it alive!'
puts
puts 'You can also ask how old the tree is, how many oranges'
puts 'are on the tree, and how many oranges you have harvested.'
puts
puts 'Your choices are as follows, please enter one'
puts 'Water, Harvest, Year, Oranges, Harvested. Grow Season, Grow Year'
puts
puts 'Have Fun!!'
puts



class OrangeTree
  # Start Tree
  def initialize
    @water  = 10
    @fruit  = 0
    @years  = 0
    @season = 0
    @harvested = 0
    puts 'A seed has been planted.'
    puts
  end

  # Water the tree
  def water
    @water = @water + 5
    puts
    puts 'You water your tree.'
    puts
    check_water
  end

  # Harvest removes 5 fruit from the tree
  def harvest
    if @fruit.positive?
      @fruit = @fruit - 5
      @harvested = @harvested + 5
      puts
      puts 'You harvest some oranges.'
      puts
    elsif @fruit.zero?
      puts
      puts 'There are no more oranges left to harvest.'
      puts
    end
  end

  # Tells you how many oranges you have harvested
  def total_harvest
    if @harvested.zero? 
    puts
    puts "You havent harvested any oranges yet!"
    puts
    else
    puts 'You have harvested ' + @harvested.to_s + ' oranges.'
    puts
    end
  end

  # Grows one season
  def let_it_grow
    passage_of_time
  end

  # Grows one year (four seasons)
  def grow_year
    4.times do
      let_it_grow
    end
    check_year
  end


  def counts_oranges
    puts
    puts 'There are ' + @fruit.to_s + ' oranges on the tree.'
    puts
  end
 
  def how_many_years
    puts
    puts 'The tree is ' + @years.to_s + ' years old.'
    puts
  end

  private

  def passage_of_time
    @season = @season + 0.25    
    check_season
    check_water
  end

  def check_season
    # Fall (all fruit falls of tree, tree does not grow)
    if (@season - @season.to_i).round(2) == 0.75
      @fruit = 0
      @water = @water - 2
      puts
      puts 'It is fall.  All the fruit has fallen from the tree.'

    # Winter(tree does not grow, adds one year's time)
    elsif (@season - @season.to_i).round(2) == 0.0
      @years = @years + 1
      @water = @water - 1
      puts
      puts 'Another year passes.'
      puts

    # Spring (tree grows, fruit blossoms)
    elsif (@season - @season.to_i).round(2) == 0.25
      @water = @water - 2
      puts
      puts 'It is spring now, you notice new growth.'
      puts 'The tree seems taller.'

    # Summer(increased water consumption)
    elsif (@season - @season.to_i).round(2) == 0.5
      @water = @water - 4
      puts
      puts "It is summer now, time to harvest before fall."
    end
  end

  def check_water
    if @water == 2
      puts
      puts "You haven't watered your tree.  It withers and is dry."
      puts
    elsif
     @water >= 15 && @water < 20
      puts
      puts 'The soil beneath your tree is soaked.'
      puts 'The branches droop and leaves are turning brown.'
      puts
    end

    if @water <= 0
      puts
      puts 'Your tree is dead and dry.'
      puts
      puts 'Game Over'
      puts 'Would you like to try again? (Y/N)'
      play_again = gets.chomp.downcase
      if play_again == 'y'
        puts
        puts
        OrangeTree.play_game
      elsif play_again != 'y'
        exit
      end
    
    end

    if @water >= 20
      puts 'Your tree is rotted and dead.'
      puts
      puts 'Game Over'
      puts
      puts 'Would you like to try again? (Y/N)'
      play_again = gets.chomp.downcase
      if play_again == 'y'
        puts
        puts
        OrangeTree.play_game
      elsif play_again != 'y'
        exit
      end
    end
  end

  def check_year
    if @years < 2
      @fruit = 0
    elsif @years >= 2 && @years <= 4
      @fruit = @fruit + 20
      puts
      puts 'You notice some fruit has started growing.'
      puts 'There is plenty of new growth.  The tree is getting tall.'
      puts
    elsif @years > 4 && @years < 6
      @fruit = @fruit + 50
      puts
      puts 'The tree gives you more fruit, and continues to grow healthy'
      puts
    elsif @years >= 6 && @years <= 10
      @fruit = @fruit + 100
      puts
      puts 'The tree is full, and bears many fruit.'
      puts 'You share some with your neighbor.'
      puts 'In return he gives you lemons.'
      puts
    elsif @years > 10 && @years < 12
      @fruit = @fruit + 200
      puts
      puts 'The tree towers above you.'
      puts 'It gives ample shade and provides fruit for you and your neighbors.'
      puts 'You exchange goods regularly.'
      puts
    elsif @years == 15
      @fruit = 0
      puts
      puts 'The tree has provided for many generations.'
      puts 'It bears no more fruit, and is withering.'
      puts 
      puts 'You Won! Play again? (Y/N)'
      play_again = gets.chomp.downcase
      if play_again == 'y'
        puts
        puts
        OrangeTree.play_game
      elsif play_again != 'y'
        exit
      end
    end
  end

  
  def self.play_game
  @tree = OrangeTree.new
    loop do
      input = gets.chomp.downcase 
      if input == 'water'
      @tree.water
      elsif input == 'harvest'
      @tree.harvest
      elsif input == 'harvested'
      @tree.total_harvest
      elsif input == 'grow season'
      @tree.let_it_grow
      puts
      elsif input == 'grow year'
      @tree.grow_year
      elsif input == 'oranges'
      @tree.counts_oranges
      elsif input == 'years'
      @tree.how_many_years
     end
   end
  end
end

OrangeTree.play_game