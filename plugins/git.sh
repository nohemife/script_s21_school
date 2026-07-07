#!/bin/bash
#!/bin/zsh

# -------------------------------------------------------------------------- git clone

function gclone() {
	cd $HOME/
	git clone $1
	project_name=$(echo "$1" | sed 's/^.*\///; s/\.git$//')
	cd $project_name
	git checkout -b develop
	code .
}

# -------------------------------------------------------------------------- peer review

function staff() {
	if [ ! -d "$HOME/Desktop/staff" ]; then
		mkdir $HOME/Desktop/staff
	fi
	cd $HOME/Desktop/staff
	# git clone -b develop $1
	git clone $1
	project_name=$(echo "$1" | sed 's/^.*\///; s/\.git$//')
	# printf $project_name
	# printf '\n'
	new_file_name="$project_name$(date +"_%Y-%m-%d_%H-%M-%S")"
	# printf $new_file_name
	# printf '\n'
	mv $project_name $new_file_name
	# printf $new_file_name
	cd $new_file_name
	git switch develop
	code .
}

# -------------------------------------------------------------------------- ssh-key

function getkey() {
    ssh-keygen -t ed25519 -f $HOME/.ssh/id_ed25519 -N "" -q
    cat $HOME/.ssh/id_ed25519.pub 
}

# -------------------------------------------------------------------------- ssh-key
