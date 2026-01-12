#!/bin/sh
set -eu

# Bootstrap server can be passed via env var KAFKA_BOOTSTRAP (default: kafka-broker:9092)
: "${KAFKA_BOOTSTRAP:=kafka-broker:9092}"

cd /opt/kafka/bin

create_topic_if_missing() {
	TOPIC="$1"
	PARTS="${2:-1}"
	RF="${3:-1}"

	# list topics and create if not exists
	if /opt/kafka/bin/kafka-topics.sh --bootstrap-server "$KAFKA_BOOTSTRAP" --list | grep -wq "$TOPIC"; then
		echo "topic exists: $TOPIC"
	else
		echo "creating topic: $TOPIC"
		/opt/kafka/bin/kafka-topics.sh --bootstrap-server "$KAFKA_BOOTSTRAP" --create --topic "$TOPIC" --partitions "$PARTS" --replication-factor "$RF"
	fi
}

create_topic_if_missing robot-heartbeat 1 1
create_topic_if_missing robot-status 1 1
create_topic_if_missing robot-position 1 1

echo "topic check complete"