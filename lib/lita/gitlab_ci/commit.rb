module Lita
  module GitlabCi
    class Commit
      attr_reader :commit

      def initialize(commit)
        @commit = OpenStruct.new(commit)
      end

      def to_s
        "<pre>  #{ sha_link } — #{ title } (#{ date }) #{ author }</pre>"
      end

      def sha_link
        "<a href=\"#{ commit.url }\">#{ sha }</a>"
      end

      def sha
        commit.id[0..6]
      end

      def title
        commit.message.split("\n").first
      end

      def date
        Time.parse(commit.timestamp).utc.strftime('%Y-%m-%d %H:%M')
      end

      def author
        @author ||= Author.new(commit.author)
      end
    end
  end
end
