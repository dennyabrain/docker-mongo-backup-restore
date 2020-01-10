echo 'initing 2'

mongod --fork --logpath /var/log/mongodb.log

mkdir ~/.aws
touch ~/.aws/credentials
echo [tattle] >> ~/.aws/credentials
echo 'aws_access_key_id = '${AWS_ACCESS_KEY_ID} >> ~/.aws/credentials
echo 'aws_secret_access_key = '${AWS_SECRET_ACCESS_KEY} >> ~/.aws/credentials

mkdir /app/data
aws s3 sync s3://${S3_DB_DIRECTORY} /app/data

mongorestore /app/data/db

mongod --shutdown
mongod



