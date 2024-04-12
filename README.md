# Running OpenCart in Docker Containers

## Introduction

This repository provides a Dockerized solution for deploying OpenCart, ensuring a consistent and scalable setup for your e-commerce platform. Using Docker, this guide simplifies the deployment process of OpenCart, focusing on a robust environment with PHP and Apache.

## Prerequisites

- Docker and Docker Compose must be installed on your machine.
- Basic understanding of Docker and containerization principles is recommended.

## Quick Start

1. **Clone this repository:**
   ```sh
   git clone https://github.com/meirm/opencart_docker
   ```

2. **Prepare OpenCart package:**
   - Place the `opencart.zip` file into the root of the cloned repository. Ensure it's named exactly as `opencart.zip`.

3. **Build and run the Docker environment:**
   ```sh
   docker-compose up -d --build
   ```

4. **Accessing OpenCart:**
   - Open [http://127.0.0.1](http://127.0.0.1) in your browser to start the OpenCart setup process.

5. **Database Configuration:**
   - Use the details from the `db` service in `docker-compose.yaml` to configure OpenCart's database connection during installation.

6. **Admin Setup:**
   - Complete the OpenCart installation through the web interface and set up your store.

## Project Structure

```
.
├── Dockerfile
├── LICENSE
├── README.md
├── README.pdf
├── custom-php.ini (Optional PHP configuration)
├── db_data (Persistent MySQL data)
├── docker-compose.yaml
├── htdocs (Your OpenCart files)
└── opencart.zip (OpenCart installation zip file)
```

## Dockerfile Explanation

The `Dockerfile` is set up with `php:8.2-apache` as a base image, and several PHP extensions and Apache modules are installed and configured to ensure OpenCart runs smoothly:

- PHP extensions necessary for OpenCart are installed, including `gd`, `intl`, and `mysqli`.
- Apache is configured with `rewrite` and `headers` modules enabled to support clean URLs and proper response handling.

## Docker Compose for OpenCart

The `docker-compose.yaml` file should define the services required to run OpenCart, including web, database, and possibly admin tools like phpMyAdmin. Ensure it's configured to match the dependencies and network configurations required by OpenCart.

## Conclusion

Containerizing OpenCart with Docker offers an easily deployable, scalable, and consistent environment for developing and producing your online store. Customize this setup as needed to suit your specific requirements.

## Author

Meir Michanie
