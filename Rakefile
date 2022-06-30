desc "Setup my workspace"
task :setup_workspace do
  Rake::Task["workspaces:install_packages"].invoke
  Rake::Task["workspaces:fix_git_config"].invoke
  Rake::Task["workspaces:add_shell_functions"].invoke
end

namespace :workspaces do
  desc "Fix Git Config"
  task :fix_git_config do
    sh "git config --global user.name 'Cody Lee'"
    sh "git config --global user.email '#{ENV['USER']}@datadoghq.com'"
    sh "git config --global user.signingkey 411C4FE3C6CA1C7C4C65BFC13C27FB622A28E065"
    sh "git config --global commit.gpgsign true"
    sh "git config --global fetch.prune true"
    sh "git config --global pull.rebase false"
    sh "git config --global push.autoSetupRemote true"
    sh "git config --global tag.forcesignannotated true"
  end

  desc "Add Shell Functions"
  task :add_shell_functions do

    dirname = File.basename(Dir.getwd)
    target = "#{Dir.home}/dotfiles"
    unless File.exist?(target)
      File.symlink(dirname, target)
    end

    for shellrc in %w[ .bashrc .zshrc ] do
      if !File.exist?("#{Dir.home}/#{shellrc}") or File.readlines("#{Dir.home}/#{shellrc}").grep(/source $HOME\/dotfiles\/workspace\/customizations\.sh/).size == 0
        open("#{Dir.home}/#{shellrc}", 'a+') do |f|
          f.puts "source $HOME/dotfiles/workspace/customizations.sh"
        end
      end
    done
  end

  desc "Install custom packages"
  task :install_packages do
    sh "apt-get update"
    sh "apt-get install -y socat libsodium23 libsodium-dev tmux"
  end
end
