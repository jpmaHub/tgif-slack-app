module SendMessageSlack
  class SuccessfulStub
    def submit_response(channel_id, team_name)
      body = {
          "channel": channel_id,
          "text": "*TGIF has successfully submitted for #{team_name}*"
      }.to_json
      WebMock.stub_request(:post, "https://slack.com/api/chat.postMessage").
          with(
              body: body,
              headers: {
                  'Accept' => 'application/json',
                  'Authorization' => 'Bearer',
                  'Content-Type' => 'application/json; charset=utf-8',
              }).
          to_return(status: 200, body: {"ok": true}.to_json, headers: {})
    end
  end
end