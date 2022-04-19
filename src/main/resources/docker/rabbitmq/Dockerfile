FROM rabbitmq:3-management
EXPOSE 5672
EXPOSE 15672
COPY createRabbitObjects.sh createRabbitObjects.sh
RUN chmod 775 createRabbitObjects.sh
ENTRYPOINT ["./createRabbitObjects.sh"]