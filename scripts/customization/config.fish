# Starship plugin
starship init fish | source

# Hidde message fish
set fish_greeting

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Add PATHs

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

# Naut
alias naut="cd $HOME/www/navenaut/naut"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

