# -------------------------------------------------------------------------- brew \ libs

function brewinstall() {
	curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
	# restart && reset
	osascript -e 'tell app "Terminal" to do script "brew install check && brew install pkg-config && brew install lmdb && brew install lcov && brew install gcovr && brew install googletest && brew install cppcheck && killall iTerm2 Terminal"'
	# osascript -e 'tell app "Terminal" to do script "brew install pkg-config && brew install llvm && brew install lmdb && brew install lcov && brew install gcovr && brew install googletest && brew install cppcheck && killall iTerm2 Terminal"'

	# osascript -e 'tell app "Terminal" to do script "brew install check && brew install lcov && brew install gcovr && brew install googletest && brew install cppcheck && killall iTerm2 Terminal"'
	# brew install check
	# brew install lcov
	# brew install gcovr
	# brew install googletest
	# echo $TERM

	# killall Terminal
	# killall iTerm2
	# pkill -a -f Terminal
	# pkill -a -f iTerm2
	# killall Terminal && killall iTerm2
	# ps -o 'ppid=' -p $$
	# ps -p $$ -o comm=
	# w -h | grep $(whoami) | awk '{ print $1 " at " $2 " from " $3; }'
	# kill -9 $(echo $$)
	sleep 3
	exit
	# reset
}

# -------------------------------------------------------------------------- 
