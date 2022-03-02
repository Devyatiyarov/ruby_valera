require 'rspec'
require_relative '../lib/game'
require_relative './mocks/file_manager_mock'
require_relative './mocks/input_mock'
require_relative './mocks/view_mock'
require_relative '../lib/game_states'

describe Game do
  include GameStates

  describe 'Game test' do
    it 'Exit works' do
      game = Game.new(ViewMock.new, FileManagerMock.new, InputMock.new('q'))
      state, valera = game.game_step(FileManagerMock.new.load_config, Valera.new, nil)
      expect(state).to eq 2
    end
    it 'save works' do
      game = Game.new(ViewMock.new, FileManagerMock.new, InputMock.new('s'))
      state, valera = game.game_step(FileManagerMock.new.load_config, Valera.new, nil)
      expect(state).to eq 1
    end
    it 'menu works' do
      game = Game.new(ViewMock.new, FileManagerMock.new, InputMock.new('m'))
      state, valera = game.game_step(FileManagerMock.new.load_config, Valera.new, nil)
      expect(state).to eq 0
    end
  end
end
