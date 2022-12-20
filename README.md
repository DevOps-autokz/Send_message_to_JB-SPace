# Send_message_to_JB-SPace
### This script allows to send messages to JetBrains Space from shell.

Clone this repo:
>git clone git@github.com:DevOps-autokz/Send_message_to_JB-SPace

cd to cloned repo and add your own .env file:
>cd Send_message_to_JB-SPace
>touch .env

Insert your own JB Space URL to .env file:
>echo space_url={your_space_url} >> .env

Insert your own JB Space Token to .env file:
_(You can generate it: Go to JB Space, open: My profile — Security — personal tokens)_
>echo token_space={your_space_url} >> .env
