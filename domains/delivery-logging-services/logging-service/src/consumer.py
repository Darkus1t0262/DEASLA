from kafka import KafkaConsumer
from src.service import save_log
import threading
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("kafka-consumer")

def start_kafka_consumer():
    try:
        consumer = KafkaConsumer(
            'alert-events',
            bootstrap_servers='18.209.131.84:9092',
            group_id='log-service',
            auto_offset_reset='earliest',
            enable_auto_commit=True
        )

        logger.info("✅ Kafka consumer started. Listening on topic 'alert-events'...")

        for message in consumer:
            try:
                decoded = message.value.decode('utf-8', errors='ignore')
                logger.info(f"🔔 Received from Kafka: {decoded}")
                save_log(service="alert-service", message=decoded)
            except Exception as msg_err:
                logger.error(f"⚠️ Error processing message: {msg_err}")
    except Exception as err:
        logger.error(f"❌ Failed to start Kafka consumer: {err}")
