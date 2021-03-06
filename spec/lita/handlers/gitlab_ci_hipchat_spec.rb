require "spec_helper"

describe Lita::Handlers::GitlabCiHipchat, lita_handler: true do
  it { is_expected.to route_http(:post, '/gitlab-ci').to(:receive) }

  describe '#receive(request, response)' do
    let(:request)           { double(Rack::Request) }
    let(:response)          { double(Rack::Response) }
    let(:body)              { StringIO.new(json) }
    let(:json)              { '{ "build_status": "success", "push_data": { "commits": [] } }' }
    let(:json_parsed)       { JSON.parse(json) }
    let(:message)           { double(Lita::GitlabCi::BuildMessage).as_null_object }
    let(:api_token)         { '6ed672d3a40eecadaf6cf4f83fc36a88' }
    let(:room)              { 'Test' }
    let(:hipchat)           { subject.send(:hipchat) }
    let(:gitlab_ci_receive) { subject.receive(request, response) }

    before do
      VCR.insert_cassette('hipchat')
      allow(request).to receive(:body).and_return(body)
      allow(Lita::GitlabCi::BuildMessage).to receive(:new).and_return(message)
      registry.config.handlers.gitlab_ci_hipchat.api_token = api_token
      registry.config.handlers.gitlab_ci_hipchat.room      = room
    end

    after do
      VCR.eject_cassette
    end

    it 'parses body to JSON' do
      expect(JSON).to receive(:parse).and_return(json_parsed)
      gitlab_ci_receive
    end

    it 'creates a new BuildMessage' do
      expect(Lita::GitlabCi::BuildMessage).to receive(:new).with(hipchat, json_parsed).and_return(message)
      gitlab_ci_receive
    end

    it 'sends the message to HipChat' do
      expect(message).to receive(:send_to_hipchat!)
      gitlab_ci_receive
    end
  end
end
