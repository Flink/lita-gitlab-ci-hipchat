require "spec_helper"

describe Lita::GitlabCi::BuildMessage do
  let(:hipchat) { double(HipChat) }
  let(:data)    { { 'build_status' => 'success' } }
  let(:message) { described_class.new(hipchat, data) }

  describe '#initialize(hipchat, data)' do
    let(:openstruct_data) { OpenStruct.new(data) }

    it 'assigns hipchat to the hipchat property' do
      expect(message.hipchat).to eq hipchat
    end

    it 'assigns data to the data property' do
      expect(message.data).to eq openstruct_data
    end
  end

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
    let(:color)           { 'green' }

    before do
      allow(message).to receive(:to_s).and_return message_str
    end

    it 'sends the message to the hipchat object' do
      expect(hipchat).to receive(:send).with('lita', message_str, color: color)
      send_to_hipchat
    end
  end

  describe '#project_status' do
    let(:formatted_status) { '<strong>success</strong>!' }
    let(:project_status)   { message.project_status }

    it 'returns the build status formatted' do
      expect(project_status).to eq formatted_status
    end
  end
end
