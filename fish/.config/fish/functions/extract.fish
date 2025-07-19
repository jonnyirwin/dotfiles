function extract --description "Extract various archive formats"
    if test (count $argv) -ne 1
        echo "Usage: extract <archive>"
        return 1
    end
    
    set -l file $argv[1]
    
    if not test -f $file
        echo "Error: '$file' is not a valid file"
        return 1
    end
    
    switch $file
        case "*.tar.bz2"
            tar xjf $file
        case "*.tar.gz"
            tar xzf $file
        case "*.bz2"
            bunzip2 $file
        case "*.rar"
            unrar e $file
        case "*.gz"
            gunzip $file
        case "*.tar"
            tar xf $file
        case "*.tbz2"
            tar xjf $file
        case "*.tgz"
            tar xzf $file
        case "*.zip"
            unzip $file
        case "*.Z"
            uncompress $file
        case "*.7z"
            7z x $file
        case "*"
            echo "Error: '$file' cannot be extracted"
            return 1
    end
end
