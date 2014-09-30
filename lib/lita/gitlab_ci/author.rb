module Lita
  module GitlabCi
    class Author
      attr_reader :author

      def initialize(author)
        @author = OpenStruct.new(author)
      end

      def to_s
        "&lt;<a href=\"mailto:#{ author.email }\">#{ author.name }</a>&gt;"
      end
    end
  end
end
