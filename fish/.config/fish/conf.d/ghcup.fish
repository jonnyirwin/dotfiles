# Add ghcup bin directory to PATH for Haskell tools (GHC, Cabal, HLS)
if test -d $HOME/.ghcup/bin
    set -gx PATH $HOME/.ghcup/bin $PATH
end
