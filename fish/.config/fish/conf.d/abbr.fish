# Want to share them with other shells... not sure if this performs well though
bash -c "source ~/.bash_aliases.common; alias" | sed -E "s/alias ([^=]+)='(.+)'/abbr -a \1 '\2'/" | source
bash -c "source ~/.bash_aliases.git; alias" | sed -E "s/alias ([^=]+)='(.+)'/abbr -a \1 '\2'/" | source
bash -c "source ~/.bash_aliases.kubectl; alias" | sed -E "s/alias ([^=]+)='(.+)'/abbr -a \1 '\2'/" | source
