# Dockerized Django Rest Framework User Account Manager

A _Dockerized_ user account management system based on the phone number validation in django rest framework.

# Main Project Link:
https://github.com/MohammadShapouri/DRF-UserAccount


## Differences
* Using postgresql as database.
* Using nginx as web server.


## Installation
* Run the following command in your teminal to clone this project or download it directly.
    ```
    $ git clone git@github.com:MohammadShapouri/Dockerized-DRF-UserAccount.git
    ```

* Navigate to the project folder.

* In '_/volumes/app/config_', create '_static_' and '_media_' folder.

* In '_/volumes_', create '_database_data_' folder.

* Add your env variables in .env file next to docker-compose.yaml file.

* Run the following command in a folder where you can see docker-compose.yaml there
    ```
    $ docker-compose up --build
    ```

