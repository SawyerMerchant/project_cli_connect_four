require 'player'

describe Player do
  let(:player) {Player.new}

  describe '#piece' do
    it 'is initialized to nil' do
      expect(player.piece).to be_nil
    end

    it 'returns the player\'s piece' do
      value = "X"
      player.piece = value
      expect(player.piece).to eq("X")
    end
  end

  describe '#piece=' do
    it 'sets the player\'s piece' do
      value = "X"
      player.piece = value
      expect(player.piece).to eq("X")
    end
  end

  describe '#placement' do
    it 'outputs prompt for player to enter piece coordinates' do
      STDOUT.should_recieve(:puts).with(puts "Enter the column in which you want to place a piece")
    end

    it 'gets player\'s response to prompt'



  end
end