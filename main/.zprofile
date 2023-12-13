 	function brup {
	eval "$(/Users/nohemife/homebrew/bin/brew shellenv)"
	brew update --force --quiet
}

 	function brsw {
	eval "$(/Users/nohemife/homebrew/bin/brew shellenv)"
	chmod -R go-w "$(brew --prefix)/share/zsh"
}