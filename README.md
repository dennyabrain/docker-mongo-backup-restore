a Mongo Service that initializes itself with a database fetched from S3

docker-compose usage example
```
version: '3'

services:
    mongo:
        container_name: 'mongo'
        image: 'nginx'
    backup-restore:
        container_name: 'backup'
        build: .
        environment: 
            AWS_ACCESS_KEY_ID: <your-aws-access-key>
            AWS_SECRET_ACCESS_KEY: <your-aws-secret-access-key>
            S3_DB_DIRECTORY: <your-s3-directory>
        depends_on: 
            - mongo

```