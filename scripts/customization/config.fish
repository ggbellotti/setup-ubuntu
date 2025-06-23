# Starship plugin
starship init fish | source

# Hidde message fish
set fish_greeting

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Add PATHs
set --export PATH /home/$USER/.cargo/bin $PATH

# Add APPs
source ~/.asdf/asdf.fish

# pnpm
set -gx PNPM_HOME "/home/ggbellotti/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Add ALIAS
alias install="sudo nala install"
alias update="sudo nala update"
alias upgrade="sudo nala update && nala list --upgradable && sudo nala upgrade"
alias remove="sudo nala remove"
alias cls="clear"
alias ls="exa --long --header --icons -la"
alias cat="bat --style=auto"
alias fishconfig="nano ~/.config/fish/config.fish"
alias lgit="lazygit"
alias ldocker="lazydocker"
alias supabase="npx supabase"
alias act="./bin/act"
alias docker-clean="bash -c 'docker kill \$(docker ps -q) 2>/dev/null || true; docker rm -f \$(docker ps -aq) 2>/dev/null || true; docker volume rm \$(docker volume ls -q) 2>/dev/null || true; docker network prune -f 2>/dev/null || true; docker rmi -f \$(docker images -aq) 2>/dev/null || true;'"
# alias docker-remove='function _docker_remove() { docker ps -aq --filter "name=$1" --format "{{.Names}}" | while read container; do echo "Removendo container: $container"; docker rm -f $container; done; docker volume prune -f; }; _docker_remove'

# Functions
function docker-remove
  set container_ids (docker ps -aq --filter "name=$argv")

  if test (count $container_ids) -eq 0
      echo "Nenhum container encontrado com o nome \"$argv\""
  else
      for container in $container_ids
          echo "Removendo container: $container"
          docker rm -f $container
      end
  end

  set matching_volumes (docker volume ls -q | grep "$argv")
  if test (count $matching_volumes) -eq 0
      echo "Nenhum volume encontrado com o nome \"$argv\""
  else
      for volume in $matching_volumes
          echo "Removendo volume: $volume"
          docker volume rm -f $volume
      end
  end

  echo "Removendo volumes órfãos não utilizados..."
  docker volume prune -f
end


# Naut
alias nb="cd $HOME/www/navenaut/naut-backend/"
alias nf="cd $HOME/www/navenaut/naut-frontend/"
alias nc="cd $HOME/www/navenaut/naut-checkout/"
alias na="cd $HOME/www/navenaut/naut-app/"

# Naut
alias naut="cd $HOME/www/navenaut"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

