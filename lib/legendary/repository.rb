module Legendary
  class Repository
    DB_REPO = 'https://github.com/rubysec/ruby-advisory-db'

    attr_accessor :path

    def initialize(path)
      @path = path
    end

    def repo_exists?
      File.directory?(File.join(path, '/.git/'))
    end

    def clone
      Git.clone(DB_REPO, path)
    end

    def pull
      repo = Git.open(path)
      repo.pull
    end

    def clone_or_update
      repo_exists? ? pull : clone
    end
  end
end
