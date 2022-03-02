require 'rspec'
require_relative '../lib/actions'

describe Actions do
  let(:action) { Actions.new }
  let(:valera) { Valera.new({ 'health' => 100, 'alcohol' => 0, 'happy' => 0, 'tired' => 0, 'money' => 300 }) }
  let(:config) { FileManager.new.load_config }
  context 'when Valera works' do
    before { action.do_action(config['actions'][0], valera) }
    it { expect(valera.money).to eq 400 }
    it { expect(valera.happy).to eq -5 }
  end
  context 'when Valera contemplates nature' do
    before { action.do_action(config['actions'][1], valera) }
    it { expect(valera.tired).to eq 10 }
    it { expect(valera.happy).to eq 1 }
  end
  context 'when Valera  drinks and watches TV series' do
    before { action.do_action(config['actions'][2], valera) }
    it { expect(valera.alcohol).to eq 30 }
    it { expect(valera.happy).to eq -1 }
    it { expect(valera.health).to eq 95 }
  end
  context 'when Valera  went to the bar' do
    before { action.do_action(config['actions'][3], valera) }
    it { expect(valera.alcohol).to eq 60 }
    it { expect(valera.happy).to eq 1 }
    it { expect(valera.tired).to eq 40 }
    it { expect(valera.health).to eq 90 }
  end
  context 'when Valera  drinking with marginal friends' do
    before { action.do_action(config['actions'][4], valera) }
    it { expect(valera.alcohol).to eq 90 }
    it { expect(valera.happy).to eq 5 }
    it { expect(valera.tired).to eq 80 }
    it { expect(valera.health).to eq 20 }
  end
  context 'when Valera Sing in the subways' do
    before { action.do_action(config['actions'][5], valera) }
    it { expect(valera.alcohol).to eq 10 }
    it { expect(valera.happy).to eq 1 }
    it { expect(valera.tired).to eq 20 }
    it { expect(valera.money).to eq 310 }
  end
  context 'change attributes when alcohol [30..60]' do
    before {
      valera.alcohol = 40
      action.do_action(config['actions'][5], valera)
    }
    it { expect(valera.money).to eq 360 }
  end
  context 'when Valera slept' do
    before { action.do_action(config['actions'][6], valera) }
    it { expect(valera.alcohol).to eq 0 }
    it { expect(valera.tired).to eq 0 }
  end
  context 'change happy when alcohol >= 70' do
    before {
      valera.alcohol = 80
      valera.happy = 10
      action.do_action(config['actions'][6], valera)
    }
    it { expect(valera.alcohol).to eq 30 }
    it { expect(valera.happy).to eq 7 }
  end
end
