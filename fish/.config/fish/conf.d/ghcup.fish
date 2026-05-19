# Add ghcup bin directory to PATH for Haskell tools (GHC, Cabal, HLS)
if test -d $HOME/.ghcup/bin
    fish_add_path $HOME/.ghcup/bin
end
if test -d $HOME/.cabal/bin
    fish_add_path $HOME/.cabal/bin
end
