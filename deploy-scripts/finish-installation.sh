# #!/bin/bash

# # Load environment variables
# source /etc/profile

# # Print deployment info
# DEPLOYMENT_TIME=$( date -u "+%Y/%m/%d %H:%M:%S" )
# echo "Deployment finished at: "$DEPLOYMENT_TIME" UTC" > /home/deploy/events/current/public/deployment_time.txt

# # Arrange folder permissions
# chown -R nginx:nginx /home/deploy/events/current/public
# chmod -R 775 /home/deploy/events/current/public

# service nginx restart