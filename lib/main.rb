require_relative './file_manager'
require_relative './view'
require_relative './input'
require_relative './game'

class Main
  def start
    view = View.new
    file_manager = FileManager.new
    input = Input.new

    Game.new(view, file_manager, input).start
  end
end
