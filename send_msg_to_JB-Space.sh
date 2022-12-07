#!/bin/bash
# Source Space URL and token from .env file:
. $HOME/scripts/JB_Space/.env
# PROVIDE YOUR COMPANY'S SPACE URL ADDRESS:
#space_url={your_space_url}

# PROVIDE YOUR OWN SPACE TOKEN: 
# You can generate one: Go to JB Space, open: My profile — Security — personal tokens
#token_space={your_space_token}

# GET SPACE USERS LIST USING FUNCTION:
get_users_list () {
	curl -s  "${space_url}/api/http/team-directory/profiles" \
		-H "Authorization: Bearer ${token_space}" \
		-H 'Accept: application/json' | \
		grep -Po '"username":"\K([\w-]+)'
	}

# ASSIGN USERS LIST TO VARIABLE, TO USE LATER:
users_list=$(get_users_list)

# UNCOMMENT THIS, IF YOU WANT TO SEND STATIC TEXT:
#message="Hello! This text was sent by script!"

# ASK USER, TO TYPE THE MESSAGE:
read -p   "Please, type your message: " "message"

# ASK USER, TO CHOOSE THE RECIPIENT:
PS3=$'\n Choose a contact to send the message: '

# SHOW ALL USERS LIST:
select name in ${users_list}
    do
	echo ${name}
	curl -s "${space_url}/api/http/chats/messages/send-message" \
	     -d "{\"content\":{\"className\":\"ChatMessage.Text\",\"text\":\"${message}\"},\"channel\":\"member:username:${name}\"}" \
	     -H "Authorization: Bearer ${token_space}" \
	     -H 'Accept: application/json' \
	     -H 'Content-Type: application/json' \
	     &>/dev/null 
	echo -e  "Your message has been sent to:  ${name}"
	exit
    done
exit
