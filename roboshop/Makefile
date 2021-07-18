help:	##Print this message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
frontend:	## Install frontend
	@frontend.sh
cart:	## Install cart
	@cart.sh
catalogue:	## Install Catalogue
	@catalogue.sh
user:	## Install User
	@user.sh
shipping:	## Install Shipping
	@shipping.sh
payment:	## Install Payment
	@payment.sh
mongodb:	## Install MongoDB
	@mongodb.sh
mysql:	## Install MySQL
	@mysql.sh
redis:	## Install Redis
	@redis.sh
rabbitmq:	## Install RabbitMQ
	@rabbitmq.sh




