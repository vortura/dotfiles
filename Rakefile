#------------------------------------------------------------------------------
#          FILE:  Rakefile
#   DESCRIPTION:  Installs dot files.
#        AUTHOR:  Richard Gray <richard@crash.net.nz>
#       VERSION:  0.0.1
#------------------------------------------------------------------------------

require 'date'
require 'fileutils'

def info(text); STDOUT.puts text; end
def error(text); STDERR.puts "Error: #{text}"; end

SCRIPT_PATH = File.split(File.expand_path(__FILE__))
SCRIPT_NAME = SCRIPT_PATH.last
CONFIG_DIR_PATH = SCRIPT_PATH.first
BACKUP_DIR_PATH = File.join(ENV['HOME'],
                             ".dotfiles_backup",
                             DateTime.now.strftime("%Y-%m-%d-%H-%M-%S"))
EXCLUDES = [
  SCRIPT_NAME,
  'terminfo',
  '.git',
  '.gitignore',
  '.gitmodules',
  'README',
  /backup\/.*$/
]

# Moves an existing dot file into the backup directory.
#
# @param [String] from the file to backup.
# @param [String] to the backup destination.
def backup(from, to)
  return unless File.exists? from
  FileUtils.mkdir_p(File.dirname(to))
  File.rename(from, to)
end

# Returns whether a path is excluded from linking into the home directory.
#
# @param [String] path the path a to file or directory.
# @return [true, false] if true, the path is excluded; otherwise, it is not.
def excluded?(path)
  strings = EXCLUDES.select { |item| item.class == String }
  regexps = EXCLUDES.select { |item| item.class == Regexp }
  excluded = strings.include? path
  regexps.each do |pattern|
    excluded = true if path =~ pattern
  end
  return excluded
end

desc 'Symlink dot files'
task :symlink do
    Dir["#{CONFIG_DIR_PATH}/*"].each do |source|
        target_relative = source.gsub("#{CONFIG_DIR_PATH}/", '')
        target_backup = File.join(BACKUP_DIR_PATH, target_relative)
        target = File.join(ENV['HOME'], ".#{target_relative}")
        next if excluded?(target_relative) \
            or (File.exists?(target) \
                and File.ftype(target) == 'link'\
                and File.identical?(source, target))
        info "Linking: #{target} to #{source}"
        begin
            backup(target, target_backup)
        rescue IOError
            error "Could not backup '#{target}', will skip symlinking '#{source}'."
            next
        end
        begin 
            File.symlink(source, target)
        rescue IOError
            error "Could not symlink '#{source}' to '#{target}'."
        end
    end
end

desc 'Compile terminfo files'
task :terminfo do
    Dir["#{CONFIG_DIR_PATH}/terminfo/*.terminfo"].each do |source|
        info "Compiling #{source}"
        `tic #{source}`
    end
end

git_config = {
    "user.name" => "Richard Gray",
    "user.email" => "richard@crash.net.nz",
    "push.default" => "simple",
    "alias.lg" => "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit",
}

desc 'Configure git'
task :gitconfig do
    info "Configuring git"
    hostname = `hostname`.strip
    if hostname == "milo"
        git_config["user.email"] = "richard.gray@smxemail.com"
    end

    git_config.each do |k, v|
        `git config --global #{k} "#{v}"`
    end
end

desc 'Install dot files.'
task :install => [:symlink, :gitconfig, :terminfo] do
end


task :default => [:install]
