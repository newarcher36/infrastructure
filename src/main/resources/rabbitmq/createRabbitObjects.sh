#!/bin/bash

createRabbitMQObjects() {
  sleep 40

  echo "Declaring exchanges"
  rabbitmqadmin declare exchange --vhost=/ name=temperature_exchange type=direct
  rabbitmqadmin declare exchange --vhost=/ name=pressure_exchange type=direct

  sleep 1

  echo "Declaring queues"
  rabbitmqadmin declare queue --vhost=/ name=get-temperature durable=true
  rabbitmqadmin declare queue --vhost=/ name=save-temperature durable=true
  rabbitmqadmin declare queue --vhost=/ name=delete-temperature durable=true
  rabbitmqadmin declare queue --vhost=/ name=get-pressure durable=true
  rabbitmqadmin declare queue --vhost=/ name=save-pressure durable=true
  rabbitmqadmin declare queue --vhost=/ name=delete-pressure durable=true

  sleep 1

  echo "Declaring bindings"
  rabbitmqadmin --vhost=/ declare binding source=temperature_exchange destination_type="queue" destination="get-temperature" routing_key="get-temperature"
  rabbitmqadmin --vhost=/ declare binding source=temperature_exchange destination_type="queue" destination="save-temperature" routing_key="save-temperature"
  rabbitmqadmin --vhost=/ declare binding source=temperature_exchange destination_type="queue" destination="delete-temperature" routing_key="delete-temperature"
  rabbitmqadmin --vhost=/ declare binding source=pressure_exchange destination_type="queue" destination="get-pressure" routing_key="get-pressure"
  rabbitmqadmin --vhost=/ declare binding source=pressure_exchange destination_type="queue" destination="save-pressure" routing_key="save-pressure"
  rabbitmqadmin --vhost=/ declare binding source=pressure_exchange destination_type="queue" destination="delete-pressure" routing_key="delete-pressure"

  sleep 1

  echo "Declaring deadletter queues"
  rabbitmqadmin declare queue --vhost=/ name=get-pressure-dlq durable=true
  rabbitmqadmin declare queue --vhost=/ name=save-pressure-dlq durable=true
}

echo "Creating rabbitmq objects in deferred"
createRabbitMQObjects &

echo "Starting rabbitmq and setting to foreground..."
rabbitmq-server fg