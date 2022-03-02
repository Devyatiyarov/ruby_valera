require_relative './valera'
require 'json'

class View
  def initialize(clear_screen_symbol = "\e[H\e[2J")
    @file_manager = FileManager.new
    @clear_screen_symbol = clear_screen_symbol
  end

  def ui(valera, error)
    puts @clear_screen_symbol
    print_stats(valera)
    print_actions
    print_configs
    print_error(error) if error
  end

  def print_stats(valera)
    puts 'Valera Parameters:'
    puts "Health: #{valera.health} \tAlcohol: #{valera.alcohol}"
    puts "Happy: #{valera.happy} \tTired: #{valera.tired}"
    puts "Money: #{valera.money}$\n\n"
  end

  def start_menu
    puts @clear_screen_symbol
    puts "Marginal Valera\n\n\n"
    puts '1 - New game'
    puts '2 - Load game'
    puts '3 - Exit'
  end

  def print_actions
    config = @file_manager.load_config
    counter = 1
    config['actions'].each do |action|
      puts "#{counter} - #{action['name']}"
      counter += 1
    end
  end

  def print_configs
    puts 's - Save game      ||      q - quit the game      ||      m - go to the menu'
  end

  def print_exit
    puts "\nBye"
  end

  def print_saved
    puts "\n****Game saved****"
    puts 'Press any key to continue'
  end

  def print_error(error)
    puts error
  end

  def game_over
    puts 'Wasted'
    sleep(2)
  end
end
