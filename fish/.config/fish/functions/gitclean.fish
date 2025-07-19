function gitclean --description "Clean up Git repository"
    echo "Cleaning up git repository..."
    git branch --merged | grep -v "\*\|main\|master\|develop" | xargs -n 1 git branch -d
    git remote prune origin
    git gc --aggressive --prune=now
    echo "Repository cleaned!"
end
