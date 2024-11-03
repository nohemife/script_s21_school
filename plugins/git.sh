#!/bin/bash
#!/bin/zsh

# -------------------------------------------------------------------------- git clone

function gclone() {
	cd ~/
	git clone $1
	project_name=$(echo "$1" | sed 's/^.*\///; s/\.git$//')
	cd $project_name
	git checkout -b develop
	open . -a 'Visual studio code'
}

# -------------------------------------------------------------------------- peer review

function peer() {
	if [ ! -d "~/Desktop/peer_review_dir" ]; then
		mkdir ~/Desktop/peer_review_dir
	fi
	cd ~/Desktop/peer_review_dir
	git clone -b develop $1
	# git clone $1
	project_name=$(echo "$1" | sed 's/^.*\///; s/\.git$//')
	# printf $project_name
	# printf '\n'
	new_file_name="$project_name$(date +"_%Y-%m-%d_%H-%M-%S")"
	# printf $new_file_name
	# printf '\n'
	mv $project_name $new_file_name
	# printf $new_file_name
	cd $new_file_name
	open . -a 'Visual studio code'
}

# --------------------------------------------------------------------------
