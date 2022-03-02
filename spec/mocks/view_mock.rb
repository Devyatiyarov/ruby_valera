require 'json'

class ViewMock
  def initialize(clear_screen_symbol = "\e[H\e[2J")
  end

  def ui(valera, error)
  end

  def print_stats(valera)
  end

  def start_menu
  end

  def print_actions
  end

  def print_configs
  end

  def print_exit
  end

  def print_saved
  end

  def print_error(error)
  end

  def game_over
  end
end
