# Development shortcuts
abbr -a py python3
abbr -a ipy ipython
abbr -a jn jupyter notebook
abbr -a jl jupyter lab

# Node.js shortcuts
abbr -a nr npm run
abbr -a ni npm install
abbr -a nid npm install --save-dev
abbr -a nig npm install -g
abbr -a nt npm test
abbr -a ns npm start

# Yarn shortcuts (if you use Yarn)
abbr -a yr yarn run
abbr -a ya yarn add
abbr -a yad yarn add --dev
abbr -a yi yarn install

# Quick server
abbr -a serve python3 -m http.server

# Rails debugging: start server with rdbg attached on 127.0.0.1:38698
abbr -a rdbgs 'bundle exec rdbg -n --open --host 127.0.0.1 --port 38698 -c -- bin/rails server'
