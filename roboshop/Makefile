help:	##	Print this message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
frontend:	##Install Frontend Component
	@bash frontend.sh
cart:		## Install Cart Component
	@bash cart.sh
catalogue:	## Install Catalogue Component
	@bash catalogue.sh
user:		## Install User Component
	@bash user.sh
shipping:	## Install Shipping Component
	@bash shipping.sh
payment:	## Install Payment Component
	@bash payment.sh
mongodb:	## Install MongoDB Component
	@bash mongodb.sh
mysql:		## Install MySQL Component
	@bash mysql.sh
redis:		## Install Redis Component
	@bash redis.sh
rabbitmq:	## Install RabbitMQ Component
	@bash rabbitmq.sh
databases: 	## Install all databases
databases: mongodb redis rabbitmq mysql






