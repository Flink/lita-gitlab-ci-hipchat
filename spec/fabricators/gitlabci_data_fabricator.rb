Fabricator(:gitlabci_data, class_name: 'Hash') do
  initialize_with do
    {
      "build_id" => 2,
      "build_status" => "failed",
      "build_started_at" => "2014-05-05T18:01:02.563Z",
      "build_finished_at" => "2014-05-05T18:01:07.611Z",
      "project_id" => 1,
      "project_name" => "Brightbox / Brightbox Cli",
      "gitlab_url" => "http://localhost:3000/brightbox/brightbox-cli",
      "ref" => "master",
      "sha" => "a26cf5de9ed9827746d4970872376b10d9325f40",
      "before_sha" => "34f57f6ba3ed0c21c5e361bbb041c3591411176c",
      "push_data" => {
        "before" => "34f57f6ba3ed0c21c5e361bbb041c3591411176c",
        "after" => "a26cf5de9ed9827746d4970872376b10d9325f40",
        "ref" => "refs/heads/master",
        "user_id" => 1,
        "user_name" => "Administrator",
        "project_id" => 5,
        "repository" => {
          "name" => "Brightbox Cli",
          "url" => "dzaporozhets@localhost:brightbox/brightbox-cli.git",
          "description" => "Voluptatibus quae error consectetur voluptas dolores vel excepturi possimus.",
          "homepage" => "http://localhost:3000/brightbox/brightbox-cli"
        },
        "commits" => [
          {
            "id" => "a26cf5de9ed9827746d4970872376b10d9325f40",
            "message" => "Release v1.2.2",
            "timestamp" => "2014-04-22T16:46:42+03:00",
            "url" => "http://localhost:3000/brightbox/brightbox-cli/commit/a26cf5de9ed9827746d4970872376b10d9325f40",
            "author" => {
              "name" => "Paul Thornthwaite",
              "email" => "tokengeek@gmail.com"
            }
          },
          {
            "id" => "34f57f6ba3ed0c21c5e361bbb041c3591411176c",
            "message" => "Fix server user data update\n\nIncorrect condition was being used so Base64 encoding option was having\nopposite effect from desired.",
            "timestamp" => "2014-04-11T18:17:26+03:00",
            "url" => "http://localhost:3000/brightbox/brightbox-cli/commit/34f57f6ba3ed0c21c5e361bbb041c3591411176c",
            "author" => {
              "name" => "Paul Thornthwaite",
              "email" => "tokengeek@gmail.com"
            }
          }
        ],
        "total_commits_count" => 2,
      }
    }
  end
end

Fabricator(:gitlabci_author_data, class_name: 'Hash') do
  initialize_with do
    {
      "name" => "Paul Thornthwaite",
      "email" => "tokengeek@gmail.com"
    }
  end
end

Fabricator(:gitlabci_commit_data, class_name: 'Hash') do
  initialize_with do
    {
      "id" => "34f57f6ba3ed0c21c5e361bbb041c3591411176c",
      "message" => "Fix server user data update\n\nIncorrect condition was being used so Base64 encoding option was having\nopposite effect from desired.",
      "timestamp" => "2014-04-11T18:17:26+03:00",
      "url" => "http://localhost:3000/brightbox/brightbox-cli/commit/34f57f6ba3ed0c21c5e361bbb041c3591411176c",
      "author" => {
        "name" => "Paul Thornthwaite",
        "email" => "tokengeek@gmail.com"
      }
    }
  end
end
