# Kafka Streaming Event Processing Project

This project demonstrates a real-time data processing pipeline using Apache Kafka, Apache Spark, and PostgreSQL. It simulates a stream of purchase events, processes them, and stores the results in a PostgreSQL database.

## Project Overview

The project consists of the following components:

1. Kafka Cluster: A distributed streaming platform
2. Spark: For stream processing
3. PostgreSQL: For storing processed data
4. Jupyter Notebook: For running producer and consumer scripts
5. Kafka UI: For monitoring Kafka topics and messages

## Prerequisites

- Docker and Docker Compose
- Python 3.x

## Setup

1. Clone the repository:
   ```
   git clone <repository-url>
   cd <project-directory>
   ```

2. Configure environment variables:
   The project uses environment variables for configuration. You may use a `.env` file or set these variables according to your preferred method. The following variables are used:
   ```
   KAFKA_BROKERS=kafka-1:29092,kafka-2:29093,kafka-3:29094
   POSTGRES_HOST=postgres
   POSTGRES_DB=your_database_name
   POSTGRES_USER=your_username
   POSTGRES_PASSWORD=your_password
   ```
   Adjust these values as needed to fit your environment and security standards.

3. Start the Docker containers:
   ```
   docker-compose up -d
   ```

4. Access Jupyter Notebook:
   - Open a web browser and go to `http://localhost:8888`
   - The token for authentication can be found in the Docker logs for the Jupyter container

## Usage

1. Create Kafka Topic:
   - Open the `create_topic.ipynb` notebook
   - Run the cells to create the `purchase_event` topic

2. Start the Producer:
   - Open the `prod_stream.ipynb` notebook
   - Run the cells to start generating and sending purchase events to Kafka

3. Start the Consumer:
   - Open the `consumer_stream.ipynb` notebook
   - Run the cells to start processing the events from Kafka and saving results to PostgreSQL

4. Monitor Kafka:
   - Access Kafka UI at `http://localhost:8080`
   - You can view topics, messages, and other Kafka metrics

5. View Results:
   - The processed data will be stored in the PostgreSQL database
   - You can connect to the database using the credentials specified in your environment configuration
   - The running total of sales will be printed in the consumer's terminal output

## Project Structure

- `docker-compose.yml`: Defines and configures the Docker services
- `Dockerfile`: Builds the custom Jupyter image with required dependencies
- `create_topic.ipynb`: Jupyter notebook for creating Kafka topics
- `prod_stream.ipynb`: Jupyter notebook for the Kafka producer
- `consumer_stream.ipynb`: Jupyter notebook for the Kafka consumer and Spark processing

## Technologies Used

- Apache Kafka
- Apache Spark
- PostgreSQL
- Python
- Jupyter Notebook
- Docker

## Troubleshooting

If you encounter any issues:

1. Ensure all containers are running:
   ```
   docker-compose ps
   ```

2. Check container logs:
   ```
   docker-compose logs <service-name>
   ```

3. Verify Kafka topic creation and message production using Kafka UI

4. Ensure the PostgreSQL connection details are correct in the consumer script

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open-source and available under the [MIT License](LICENSE).