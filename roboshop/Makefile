help:		##	Print this message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
frontend:	## Install Frontend Component
	@frontend.sh
cart:		## Install Cart Component
	@cart.sh
catalogue:	## Install Catalogue Component
	@catalogue.sh
user:		## Install User Component
	@user.sh
shipping:	## Install Shipping Component
	@shipping.sh
payment:	## Install Payment Component
	@payment.sh
mongodb:	## Install MongoDB Component
	@mongodb.sh
mysql:		## Install MySQL Component
	@mysql.sh
redis:		## Install Redis Component
	@redis.sh
rabbitmq:	## Install RabbitMQ Component
	@rabbitmq.sh
databases: 	## Install all databases
databases: mongodb redis rabbitmq mysql




