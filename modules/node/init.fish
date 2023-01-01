fish_add_path (yarn global bin)

# TODO: These paths are specific to macOS. Update to support NixOS.
set -gx NPM_CONFIG_USERCONFIG /Users/nelson/.config/npm/config
set -gx NPM_CONFIG_CACHE /Users/nelson/.config/npm
set -gx NPM_CONFIG_PREFIX /Users/nelson/npm
set -gx NODE_REPL_HISTORY /Users/nelson/node/repl_history
