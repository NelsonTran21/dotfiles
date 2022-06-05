if type -q fd # config.modules.fd.enable
  abbr --add cdf "cd (fd --type directory | fzf)"
else
  abbr --erase cdf
end

if type -q rg # config.modules.rg.enable
  set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --glob '!.git'"
end

if type -q bat # config.modules.bat.enable
  set -gx FZF_DEFAULT_OPTS "--multi --preview 'bat --color=always {}'"
end
