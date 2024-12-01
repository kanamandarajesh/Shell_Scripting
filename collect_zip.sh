#!/bin/bash

set -x

# Get date and time with a 2-hour 30-minute offset
DATE_AND_TIME=$(date --date="+2 hours 30 minutes" "+-%d-%b-%y-%I%p")

# Copy files from remote server to local Downloads directory
scp cont160150:/home/bastion/logs${DATE_AND_TIME}* ~/Downloads/

# Move to Downloads directory
cd ~/Downloads || exit

# Extract files from tar archive
tar -xvf logs${DATE_AND_TIME}*.tar.xz -C ~/Downloads

# Create zip files for specific logs
zip KE-MSB${DATE_AND_TIME}.zip *ke-msb-prod${DATE_AND_TIME}*
zip UG-MSB${DATE_AND_TIME}.zip *ug-msb-prod${DATE_AND_TIME}*
zip TZ-MSB${DATE_AND_TIME}.zip *tz-msb-prod${DATE_AND_TIME}*
zip KE-SWIFT${DATE_AND_TIME}.zip *ke-swift-prod*
zip TZ-SWIFT${DATE_AND_TIME}.zip *tz-swift-prod*
zip UG-SWIFT${DATE_AND_TIME}.zip *ug-swift-prod*

rm *.log && rm *.tar.xz
cd

====
====

#!/bin/bash

# Get date and time with a 2-hour 30-minute offset
DATE_AND_TIME=$(date --date="+2 hours 30 minutes" "+-%d-%b-%y-%I-30%p")
TIME=$(date --date="+2 hours 30 minutes" "+-%d-%b-%y-%I%p-3*")
# Copy files from remote server to local Downloads directory
scp cont160150:/home/bastion/logs${TIME}* ~/Downloads/

# Move to Downloads directory
cd ~/Downloads || exit

# Extract files from tar archive
#tar -xvf logs-${DATE_AND_TIME}*.tar.xz -C ~/Downloads
find ~/Downloads/ -name 'logs-*3*.tar.xz' -print0 | xargs -0 -I {} tar -xvf {} -C .

# Create zip files for specific logs
zip KE-SWIFT${DATE_AND_TIME}.zip *ke-swift-prod*
zip TZ-SWIFT${DATE_AND_TIME}.zip *tz-swift-prod*
zip UG-SWIFT${DATE_AND_TIME}.zip *ug-swift-prod*

rm *.log && rm *.tar.xz
cd


