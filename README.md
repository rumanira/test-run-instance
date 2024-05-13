# Components
- manager script -> run-instance-script.sh
- user data scripts -> start-script-*.txt
- python script with parameter -> test.py

# Configure user data script
- create different user data script for each parameter
- make sure to change directory to project directory
- make sure to use fullpath for python

# Configure manager script
- Change instance name prefix to the desireable name
- change image id to the existing ami-id
- mention instance type
- mention a previouly created key pair name (if you want to ssh)
- setup instance market options for spot instance (only max price and validuntil that can be set)
- setup a previously created Security Group (make sure it allowed SSH)
- setup the user data
- if you use aws profile, make sure to setup
- repeat the above steps for each user data scripts
