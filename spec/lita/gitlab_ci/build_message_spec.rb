require "spec_helper"

describe Lita::GitlabCi::BuildMessage do
  let(:hipchat) { double(HipChat) }
  let(:data)    { Fabricate(:gitlabci_data) }
  let(:message) { described_class.new(hipchat, data) }

  describe '#color' do
    let(:color) { message.color }

    context 'when build status is "success"' do
      before do
        data['build_status'] = 'success'
      end

      it 'returns "green"' do
        expect(color).to eq 'green'
      end
    end

    context 'when build status is "failed"' do
      before do
        data['build_status'] = 'failed'
      end

      it 'returns "red"' do
        expect(color).to eq 'red'
      end
    end
  end

  describe '#send_to_hipchat!' do
    let(:message_str)     { '' }
    let(:send_to_hipchat) { message.send_to_hipchat! }
    let(:color)           { 'red' }

    before do
      allow(message).to receive(:to_s).and_return message_str
    end

    it 'sends the message to the hipchat object' do
      expect(hipchat).to receive(:send).with('lita', message_str, color: color)
      send_to_hipchat
    end
  end

  describe '#project_status' do
    let(:formatted_status) { '<strong>failed</strong>!' }
    let(:project_status)   { message.project_status }

    it 'returns the build status formatted' do
      expect(project_status).to eq formatted_status
    end
  end

  describe '#project_branch' do
    let(:formatted_branch) { '(master)' }
    let(:project_branch)   { message.project_branch }

    it 'returns the branch formatted' do
      expect(project_branch).to eq formatted_branch
    end
  end

  describe '#project_infos' do
    let(:formatted_infos) { '<a href="http://localhost:3000/brightbox/brightbox-cli">Brightbox / Brightbox Cli</a>' }
    let(:project_infos)   { message.project_infos }

    it 'returns the project name formatted' do
      expect(project_infos).to eq formatted_infos
    end
  end

  describe '#commits' do
    let(:expected_commits) { data['push_data']['commits'].reverse }
    let(:commits)          { message.commits }

    it 'returns the available commits in the reverse order' do
      expect(commits).to eq expected_commits
    end
  end

  describe '#build_commits' do
    let(:commits)       { message.commits }
    let(:build_commits) { message.build_commits }

    it 'returns new Commit object for each commit' do
      expect(Lita::GitlabCi::Commit).to receive(:new).exactly(commits.size).times
      build_commits
    end
  end

  describe '#build_header' do
    let(:formatted_header) { '<p>Build for <a href="http://localhost:3000/brightbox/brightbox-cli">Brightbox / Brightbox Cli</a> (master): <strong>failed</strong>!</p>' }
    let(:build_header)     { message.build_header }

    it 'returns formatted header for current build' do
      expect(build_header).to eq formatted_header
    end
  end

  describe '#to_s' do
    let(:formatted_message) { [message.build_header, message.build_commits].join }
    let(:message_string)    { message.to_s }

    it 'returns the build message as a string' do
      expect(message_string).to eq formatted_message
    end
  end
end
