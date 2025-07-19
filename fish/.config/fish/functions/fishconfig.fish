function fishconfig --description "Quick access to fish configuration files"
    set -l config_dir ~/.config/fish
    
    if test (count $argv) -eq 0
        echo "Available config files:"
        echo "  config - Main configuration"
        echo "  abbr - Abbreviations"
        echo "  env - Environment variables"
        echo "  dev - Development shortcuts"
        echo "  functions - Functions directory"
        return
    end
    
    switch $argv[1]
        case config
            $EDITOR $config_dir/config.fish
        case abbr
            $EDITOR $config_dir/conf.d/abbreviations.fish
        case env
            $EDITOR $config_dir/conf.d/environment.fish
        case dev
            $EDITOR $config_dir/conf.d/dev_shortcuts.fish
        case functions
            cd $config_dir/functions
        case '*'
            echo "Unknown config file: $argv[1]"
            return 1
    end
end
