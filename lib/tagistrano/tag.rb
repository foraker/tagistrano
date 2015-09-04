module Tagistrano
  class Tag < String
    def self.next_tags
      last_tag = all.last

      [
        last_tag.next_major_tag,
        last_tag.next_minor_tag,
        last_tag.next_patch_tag
      ]
    end

    def self.all
      git_tags.split(/\s+/).map { |tag| new(tag) }.sort
    end

    def self.git_tags
      `git tag`
    end

    def next_major_tag
      [major + 1, 0, 0].join('.')
    end

    def next_minor_tag
      [major, minor + 1, 0].join('.')
    end

    def next_patch_tag
      [major, minor, patch + 1].join('.')
    end

    def <=>(other)
      version <=> other.version
    end

    def version
      [major, minor, patch]
    end

    private

    def numbers
      split(".")
    end

    def major
      numbers[0].to_i
    end

    def minor
      numbers[1].to_i
    end

    def patch
      numbers[2].to_i
    end
  end
end
