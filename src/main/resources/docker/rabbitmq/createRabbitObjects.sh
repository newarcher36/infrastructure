#!/bin/bash

createRabbitMQObjects() {
  sleep 40

  echo "Declaring exchanges"
  rabbitmqadmin declare exchange --vhost=/ name=temperature_exchange type=direct

  sleep 4

  echo "Declaring queues"
  rabbitmqadmin declare queue --vhost=/ name=get-temperature durable=true
  rabbitmqadmin declare queue --vhost=/ name=save-temperature durable=true

  sleep 4

  echo "Declaring bindings"
  rabbitmqadmin --vhost=/ declare binding source=temperature_exchange destination_type="queue" destination="get-temperature" routing_key="get-temperature"
  rabbitmqadmin --vhost=/ declare binding source=temperature_exchange destination_type="queue" destination="save-temperature" routing_key="save-temperature"
}

echo "Creating rabbitmq objects in the background"
createRabbitMQObjects &

echo "Starting rabbitmq and setting it up as foreground process"
rabbitmq-server fg