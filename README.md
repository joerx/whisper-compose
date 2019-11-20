# Whisper Compose

Docker compose stack for whisper development

## Components

| App               | Description      | Docker                          | Default Port |
|-------------------|------------------|---------------------------------|--------------|
| `whisper-api`     | API Gateway      | quay.io/yodo-io/whisper-api     | `9090`       |
| `whisper-backend` | Main backend app | quay.io/yodo-io/whisper-backend | `9091`       |
| `whisper-auth`    | Auth server      | TBD                             | `9092`       |
| `nginx`           | HTTP Proxy       | nginx:1.17.2-alpine             | `8080`       |
| `postgres`        | Database server  | postgres:9.4                    | `5432`       |

## Usage

### Entire Stack

```sh
docker-compose up -d
```

### Logs

```sh
# All logs
docker-compose logs -f

# Only backend and API 
docker-compose logs -f backend api
```

### Local Development

- Develop a part of the stack locally while having all required dependencies running
- For example, we want to work on [whisper-api](https://github.com/joerx/whisper-api)
- Bring up selected components, e.g. only backend and database:

  ```sh
  docker-compose up -d postgres backend
  ```

- Or bring up the entire stack first, then stop selected components:

  ```sh
  docker-compose up -d
  docker-compose stop api
  ```

- Then clone whisper-api locally and run it via Maven:
- Note that this assumas that all apps are running on their default ports

  ```sh
  # in whisper-api
  ./mvnw spring-boot:run
  ```

- Alternatively, just run your app on a different port:

  ```
  SERVER_PORT=10000 ./mvnw spring-boot:run
  ```
