RSpec.describe Score do

  describe '#points_for_winner_team' do

    context 'when overtime is true' do
      it 'returns points for overtime game' do
        score = Score.new(extra_time: true)

        expect(score.points_for_winner_team).to eq(1)
      end
    end

    context 'when overtime is false' do
      it 'returns points for regular game' do
        score = Score.new

        expect(score.points_for_winner_team).to eq(2)
      end
    end

  end

end
