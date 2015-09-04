require "active_support"
require "active_support/core_ext"
require "colorize"
require 'tagistrano/tag'

def tag_release
  if tag = ask_for_tag.presence
    puts "\nTagging as #{tag}\n\n".colorize(:green)
    `git tag #{tag}`
    `git push --tags`
  end
end

def ask_for_tag
  next_tags = Tagistrano::Tag.next_tags

  puts "\nTag: (leave blank to skip tagging)".underline

  prompt = <<-prompt

1. Major #{next_tags.first}
2. Minor #{next_tags.second}
3. Patch #{next_tags.third}
  prompt

  ask(prompt, '')

  option = fetch(prompt)

  if ["1", "2", "3", ""].include?(option.strip)
    option.to_i > 0 ? next_tags[option.to_i - 1] : nil
  else
    puts "Didn't get 1, 2, 3 or blank".colorize(:red)
    ask_for_tag
  end
end
