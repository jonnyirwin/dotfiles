function proj --description "Navigate to project directories quickly"
    set -l project_dirs ~/projects ~/code ~/dev ~/work
    
    if test (count $argv) -eq 0
        # List all projects
        echo "Available projects:"
        for dir in $project_dirs
            if test -d $dir
                for project in $dir/*/
                    echo "  "(basename $project)
                end
            end
        end
        return
    end
    
    set -l target $argv[1]
    
    for dir in $project_dirs
        if test -d $dir/$target
            cd $dir/$target
            return
        end
    end
    
    echo "Project '$target' not found"
    return 1
end
