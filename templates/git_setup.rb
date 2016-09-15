module Liftoff
  class GitSetup
    def initialize(config)
      @config = config
      @project_repo_name = config.project_repo_name
    end

    def setup
      if @config.configure_git
        generate_files

        if needs_git_init?
          initialize_repo
          create_initial_commit
          initialize_git_flow
        end
      end
    end

    private

    def generate_files
      file_manager.generate('gitignore', '.gitignore', @config)
      file_manager.generate('gitattributes', '.gitattributes', @config)
    end

    def initialize_repo
      `git init`
      `git remote add origin git@git1.digio.es:#{@config.project_repo_name}`
    end

    def create_initial_commit
      `git add -A`
      `git commit --message='Initial Commit'`
    end

    def needs_git_init?
      `git rev-parse --git-dir 2>/dev/null`.strip.empty?
    end

    def initialize_git_flow
      `git reset --hard`
      `git flow init -f -d`
    end

    def file_manager
      @file_manager ||= FileManager.new
    end
  end
end
