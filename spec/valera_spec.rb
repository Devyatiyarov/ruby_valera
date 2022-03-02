require_relative './spec_helper'
require_relative '../lib/valera'

describe Valera do
  subject(:valera) do
    Valera.new
  end
  context 'starting characteristics' do
    it { expect(valera.health).to eq 100 }
    it { expect(valera.alcohol).to eq 0 }
    it { expect(valera.happy).to eq 0 }
    it { expect(valera.tired).to eq 0 }
    it { expect(valera.money).to eq 300 }
  end
  describe '#health=' do
    context 'range of health attr = [0, 100]' do
      it 'valid value' do
        valera.health = 50
        expect(valera.health).to eq 50
      end
      it 'more than upper bound' do
        valera.health = 110
        expect(valera.health).to eq 100
      end
      it 'less than lower bound' do
        valera.health = -10
        expect(valera.health).to eq 0
      end
    end
  end
  describe '#mana=' do
    context 'range of mana attr = [0, 100]' do
      it 'valid value' do
        valera.alcohol = 50
        expect(valera.alcohol).to eq 50
      end
      it 'more than upper bound' do
        valera.alcohol = 110
        expect(valera.alcohol).to eq 100
      end
      it 'less than lower bound' do
        valera.alcohol = -10
        expect(valera.alcohol).to eq 0
      end
    end
  end
  describe '#happy=' do
    context 'range of happy attr = [-10, 10]' do
      it 'valid value' do
        valera.happy = 5
        expect(valera.happy).to eq 5
      end
      it 'more than upper bound' do
        valera.happy = 20
        expect(valera.happy).to eq 10
      end
      it 'less than lower bound' do
        valera.happy = -20
        expect(valera.happy).to eq(-10)
      end
    end
  end
  describe '#tired=' do
    context 'range of tired = [0, 100]' do
      it 'valid value' do
        valera.tired = 50
        expect(valera.tired).to eq 50
      end
      it 'more than upper bound' do
        valera.tired = 110
        expect(valera.tired).to eq 100
      end
      it 'less than lower bound' do
        valera.tired = -10
        expect(valera.tired).to eq 0
      end
    end
  end
  describe '#dead?' do
    context 'Valera is dead' do
      it 'HP = 0' do
        valera.health = 0
        expect(valera.dead?).to be true
      end
      it 'happy = -10' do
        valera.happy = -10
        expect(valera.dead?).to be true
      end
      it 'money <= -100' do
        valera.money = -100
        expect(valera.dead?).to be true
      end
      it 'tired = 100' do
        valera.tired = 100
        expect(valera.dead?).to be true
      end
    end
    context 'Valera is not dead' do
      it 'HP = 10' do
        valera.health = 10
        expect(valera.dead?).to be false
      end
      it 'happy = -5' do
        valera.happy = -5
        expect(valera.dead?).to be false
      end
      it 'money = 100' do
        valera.money = 100
        expect(valera.dead?).to be false
      end
      it 'tired = 90' do
        valera.tired = 90
        expect(valera.dead?).to be false
      end
    end
  end
end
