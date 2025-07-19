function weather --description "Get weather for a location"
    if test (count $argv) -eq 0
        curl -s "wttr.in?format=3"
    else
        curl -s "wttr.in/$argv[1]?format=3"
    end
end
