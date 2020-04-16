## Run NATS via Docker

```
docker run -p 4222:4222 -p 8222:8222 nats -DV
```

## Set DB (Postgresql - Default user)

```
rails db:setup
```

## With no workers (a message is sent to NATS)

```
WEB_CONCURRENCY=0 rails s
```

## With workers (no message is sent to NATS)

```
WEB_CONCURRENCY=2 rails s
```

## Test

Watch NATS server if a command is comming from the application

```
open http://localhost:300
```
