#------------------------------------------------------------------------------
#          FILE:  Rakefile
#   DESCRIPTION:  Installs dot files.
#        AUTHOR:  Richard Gray <richard@crash.net.nz>
#       VERSION:  0.0.1
#------------------------------------------------------------------------------

def info(text); STDOUT.puts text; end

SCRIPT_PATH = File.split(File.expand_path(__FILE__))
SCRIPT_NAME = SCRIPT_PATH.last
CONFIG_DIR_PATH = SCRIPT_PATH.first


desc 'Symlink dot files'
task :symlink do
    Dir["#{CONFIG_DIR_PATH}/{*,.*}"].each do |source|
        info source
    end
end


desc 'Install dot files.'
task :install => [:symlink] do
    info "Foo"
end


task :default => [:install]
