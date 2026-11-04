# RabbitMQ 4.1.x com UI
FROM rabbitmq:4.1-management

USER root
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Versão do plugin compatível com RabbitMQ 4.1
ENV DELAYED_PLUGIN_VERSION=4.1.0

# Instala o plugin x-delayed-message
RUN curl -fsSL -o /opt/rabbitmq/plugins/rabbitmq_delayed_message_exchange-${DELAYED_PLUGIN_VERSION}.ez \
  https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v${DELAYED_PLUGIN_VERSION}/rabbitmq_delayed_message_exchange-${DELAYED_PLUGIN_VERSION}.ez

# Habilita plugins
RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange rabbitmq_prometheus

USER rabbitmq
