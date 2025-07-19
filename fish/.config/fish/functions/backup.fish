function backup --description "Create a backup of a file with timestamp"
    if test (count $argv) -ne 1
        echo "Usage: backup <file>"
        return 1
    end
    
    set -l file $argv[1]
    set -l timestamp (date +%Y%m%d_%H%M%S)
    cp $file "$file.backup_$timestamp"
    echo "Backup created: $file.backup_$timestamp"
end
