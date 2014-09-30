require "lita"

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require 'hipchat'
require 'lita/gitlab_ci/author'
require 'lita/gitlab_ci/commit'
require 'lita/gitlab_ci/build_message'
require "lita/handlers/gitlab_ci_hipchat"
