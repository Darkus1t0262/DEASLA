using Confluent.Kafka;
using System;
using System.Threading;

namespace AlertServiceApp.Services  // Use the correct namespace here
{
    public class KafkaProducer
    {
        private readonly string _bootstrapServers = "localhost:9092"; // Kafka Broker address
        private readonly string _topic = "alert-topic"; // Kafka Topic for alerts

        public async Task ProduceMessage(string message)
        {
            var config = new ProducerConfig { BootstrapServers = _bootstrapServers };

            using (var producer = new ProducerBuilder<Null, string>(config).Build())
            {
                try
                {
                    var dr = await producer.ProduceAsync(_topic, new Message<Null, string> { Value = message });
                    Console.WriteLine($"Message sent to {dr.TopicPartitionOffset}");
                }
                catch (ProduceException<Null, string> e)
                {
                    Console.WriteLine($"Error producing message: {e.Error.Reason}");
                }
            }
        }
    }
}
