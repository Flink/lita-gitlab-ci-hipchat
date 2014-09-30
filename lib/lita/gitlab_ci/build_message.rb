module Lita
  module GitlabCi
    class BuildMessage
      attr_reader :hipchat, :data

      def initialize(hipchat, data)
        @hipchat = hipchat
        @data    = OpenStruct.new(data)
      end

      def color
        data.build_status == 'success' ? 'green' : 'red'
      end

      def to_s
        [build_header, build_commits].join
      end

      def send_to_hipchat!
        hipchat.send('lita', to_s, color: color)
      end

      def build_header
        "<p>Build for #{ project_infos } #{ project_branch }: #{ project_status }</p>"
      end

      def build_commits
        commits.map do |commit|
          Commit.new(commit)
        end
      end

      def commits
        data.push_data['commits'].reverse
      end

      def project_infos
        "<a href=\"#{ data.gitlab_url }\">#{ data.project_name }</a>"
      end

      def project_branch
        "(#{ data.ref })"
      end

      def project_status
        "<strong>#{ data.build_status }</strong>!"
      end
    end
  end
end
