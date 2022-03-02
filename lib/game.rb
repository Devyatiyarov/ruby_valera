require_relative './game_states'
require_relative './actions'

class Game
  include GameStates

  def initialize(view, file_manager, input)
    @view = view
    @file_manager = file_manager
    @input = input
  end

  def start_menu
    @view.start_menu
    input = @input.key.to_i
    case input
    when 1
      [RUNNING, Valera.new]
    when 2
      saved_game = @file_manager.load_game
      [RUNNING, Valera.new(saved_game)]
    when 3
      EXIT
    else
      MENU
    end
  end

  def start
    game
  end

  def game
    config = @file_manager.load_config
    state = MENU
    valera = Valera.new
    error = nil

    loop do
      case state
      when MENU
        state, valera = start_menu
      when RUNNING
        state, valera, error = game_step(config, valera, error)
      when EXIT
        return
      end
    end
  end

  def game_step(config, valera, error)
    @view.ui(valera, error)
    input = @input.key
    case input
    when 'q'
      @view.print_exit
      return EXIT, valera
    when 'm'
      @file_manager.save(valera)
      return MENU, valera
    when 's'
      @file_manager.save(valera)
      @view.print_saved
      @input.key
    end
    input = input.to_i - 1
    return RUNNING, valera if input.negative? || input > config['actions'].length - 1

    error = Actions.new.do_action(config['actions'][input], valera)

    if valera.dead?
      @view.game_over
      return MENU, valera
    end
    [RUNNING, valera, error]
  end
end
