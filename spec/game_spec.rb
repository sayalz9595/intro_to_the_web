require 'game'
describe Game do
  let(:prashant){double :player}
  let(:samed){double :player}
  subject(:game){described_class.new(prashant, samed)}

  context "#attack" do
    it "Player 1 damages Player 2" do
      allow(prashant).to receive(:receive_damage)
      allow(samed).to receive(:receive_damage)
      expect(samed).to receive(:receive_damage)
      game.attack(samed)
    end
  end

  context "Has two players" do
    it "should return player1"do
      expect(game.player_1).to eq prashant
    end

    it "should return player2"do
      expect(game.player_2).to eq samed
    end


  end



end
