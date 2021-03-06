describe UseCase::SubmitTgif do
  let(:tgif_gateway) { spy(all: []) }
  let(:use_case) { described_class.new(tgif_gateway: tgif_gateway) }

  it 'uses the tgif gateway to submit tgifs' do
    tgif_details = {team_name: 'teamone', message: 'we done it', slack_user_id: 'U78'}
    use_case.execute(tgif: tgif_details)

    expect(tgif_gateway).to have_received(:save) do |tgif|
      expect(tgif.team_name).to eq('teamone')
      expect(tgif.message).to eq('we done it')
      expect(tgif.slack_user_id).to eq('U78')
    end
  end

  it 'returns an error when no tgif to submit' do
    response = use_case.execute(tgif: {})
    expect(response).to eq(successful: false, error: 'no tgif to submit')
  end
end 