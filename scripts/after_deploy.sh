#!/bin/bash

cd /home/ubuntu/do_it_django_test || {
    echo "❌ Failed to change directory. Exiting."
    exit 1
}

echo "> 🔵 Stop & Remove docker services."
sudo docker-compose down || {
    echo "❌ Failed to stop Docker services. Exiting."
    exit 1
}

echo "> 🟢 Run new docker services."
sudo docker-compose up -d --build >> /var/log/deploy.log 2>&1 || {
    echo "❌ Failed to start Docker services. Check /var/log/deploy.log for details."
    exit 1
}
