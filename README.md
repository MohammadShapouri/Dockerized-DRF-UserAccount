# Dockerized Django Rest Framework User Account Manager

A _Dockerized_ user account management system based on the phone number validation in Django rest framework.

# Main Project Link:
https://github.com/MohammadShapouri/DRF-UserAccount


## Differences
* Using Postgresql as a database.
* Using nginx as the web server.


## Installation
* Run the following command in your terminal to clone this project or download it directly.
    ```
    $ git clone git@github.com:MohammadShapouri/Dockerized-DRF-UserAccount.git
    ```

* Navigate to the project folder.

* In '_/volumes/app/config_', create '_static_' and '_media_' folder.

* In '_/volumes_', create '_postgresql_data_' and '_redis_data_' folder.

* Add your env variables in .env file next to docker-compose.yaml file.

* Run the following command in a folder where you can see docker-compose.yaml there
    ```
    $ docker-compose up --build
    ```

