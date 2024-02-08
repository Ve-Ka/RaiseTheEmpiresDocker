#!/bin/bash
set -x

if [ -z "$(ls -A /app)" ]; then
    # Original Repo https://github.com/AcidCaos/raisetheempires.git
    git clone https://github.com/Ve-Ka/raisetheempires.git .
else
    echo "Directory is not empty, skip git clone"
fi

pip3 install --break-system-packages -r requirements.txt

# Need to downgrade to older version of Flask and Flask-session
pip install Flask==2.1.0 --break-system-packages \
&& pip install Flask-session==0.4.0 --break-system-packages

exec python3 empires-server.py --no-popup --no-crash-log --port 80 --host 0.0.0.0
