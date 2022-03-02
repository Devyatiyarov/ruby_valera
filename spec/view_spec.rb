require 'rspec'
require_relative '../lib/view'
require_relative '../lib/file_manager'
require_relative '../lib/valera'

describe View do
  describe 'View test' do
    context '#render' do
      it 'print stats' do
        expect do
          view = View.new
          view.print_stats(Valera.new)
        end.to output("Valera Parameters:\nHealth: 100 \tAlcohol: 0\nHappy: 0 \tTired: 0\nMoney: 300$\n\n").to_stdout
      end
      it 'start menu' do
        expect do
          view = View.new('')
          view.start_menu
        end.to output("\nMarginal Valera\n\n\n1 - New game\n2 - Load game\n3 - Exit\n").to_stdout
      end
      it 'print configs' do
        expect do
          view = View.new
          view.print_configs
        end.to output("s - Save game      ||      q - quit the game      ||      m - go to the menu\n").to_stdout
      end
      it 'print exit' do
        expect do
          view = View.new
          view.print_exit
        end.to output("\nBye\n").to_stdout
      end
      it 'print saved' do
        expect do
          view = View.new
          view.print_saved
        end.to output("\n****Game saved****\nPress any key to continue\n").to_stdout
      end
      it 'print error' do
        expect do
          view = View.new
          view.print_error('error')
        end.to output("error\n").to_stdout
      end
      it 'print over' do
        expect do
          view = View.new
          view.game_over
        end.to output("Wasted\n").to_stdout
      end
    end
  end
end
