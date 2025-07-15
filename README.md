
# Laravel Backend Dashboard

> ⚠️ **Important Notice**  
> This repository is a **template base for Laravel + React + Docker projects**.  
> **Do not clone it directly (`git clone`)**. It is meant to serve as a clean starting point.

✅ Instead, create your own repository based on this template:

### ✔️ Using GitHub Web UI

1️⃣ Click the green **“Use this template”** button at the top right.
2️⃣ Create a new repository under your GitHub account.
3️⃣ Then clone your newly created project:

```bash
git clone https://github.com/your-username/your-new-project.git
```

## 🧪 Using GitHub CLI
### If you have the GitHub CLI installed:

```bash
gh repo create my-project --template your-username/this-template-repo --private
git clone https://github.com/your-username/my-project.git
```
---

## 🧰 Tech Stack

- ⚙️ Laravel 10+ (PHP 8.2 FPM)
- ⚛️ React (via Vite)
- 🐬 MySQL 8
- 🐘 phpMyAdmin
- 🐳 Docker & Docker Compose

---

## Before you get started, you need to install the following tools:

### 1️⃣ WSL 2

WSL 2 (Windows Subsystem for Linux) is required to run a Linux environment within Windows. It’s essential for running Docker, PHP, and Node.js correctly in this project. You can follow the instructions to install WSL 2 [here](https://docs.microsoft.com/en-us/windows/wsl/install).

Make sure you have WSL 2 installed and set as your default version by running:

```bash
wsl --set-default-version 2
```

### 2️⃣ Install PHP VERSION 8.2 / Define the default version

You need to install PHP 8.2 and configure it as the default version. Follow these steps:

1. **Install PHP 8.2:**

   ```bash
   sudo apt update
   sudo apt install php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-zip php8.2-curl php8.2-xml
   ```

2. **Set PHP 8.2 as the default:**

   ```bash
   sudo update-alternatives --set php /usr/bin/php8.2
   sudo update-alternatives --set phpize /usr/bin/phpize8.2
   sudo update-alternatives --set php-config /usr/bin/php-config8.2
   ```

3. **Verify the PHP version:**

   ```bash
   php -v
   ```

### 2.1️⃣ Some Libraries Needed

To ensure proper functionality, install some essential libraries:

#### CURL Extension for PHP:

Run the following command to install the `curl` extension for PHP:

```bash
sudo apt install php8.2-curl
```

#### Unzip and 7z:

To extract compressed files, you need the following utilities:

```bash
sudo apt install unzip p7zip-full
```

### 3️⃣ Install Node.js

Ensure you have Node.js installed (recommended version: 20.x):

```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
```

Check the installation:

```bash
node -v
npm -v
```

### 4️⃣ Install Composer

Composer is a dependency manager for PHP. You can install it by running the following commands:

```bash
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

Verify the Composer installation:

```bash
composer --version
```

---

## 📦 Getting Started

### 1️⃣ Install dependencies

Run the following commands inside the project directory:

```bash
composer install
npm install
```

After installing, commit the generated `composer.lock` and `package-lock.json` files to ensure everyone uses the same versions.

The included `Dockerfile` is based on `php:8.2-fpm-alpine` and installs Node.js `20.11.1`.

### 2️⃣ Configure environment variables

Copy `.env.example` to `.env` and adjust your configuration.

```bash
cp .env.example .env
```

Set your database connection details in the `.env` file. Ensure `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, and `DB_PASSWORD` are set correctly.

### 3️⃣ Start the Docker environment

Start the Docker containers with:

```bash
docker-compose up -d --build
```

### 4️⃣ Access phpMyAdmin

You can access the database visually at:

🔗 http://localhost:8080

Use the following login credentials (from your `.env`):

- Server: db
- Username: `${DB_USERNAME}` (default: `laraveluser`)
- Password: `${DB_PASSWORD}` (default: `laravelpass`)

➡️ Ensure that the database specified in `.env` exists (`DB_DATABASE`), or create it via phpMyAdmin before running migrations.

### 5️⃣ Run database migrations and generate Laravel app key

Once your containers are running and the database exists, run:

```bash
docker-compose exec app php artisan migrate
docker-compose exec app php artisan key:generate
```
### 6️⃣ Build frontend assets (Vite)

```bash
docker-compose exec app npm run build
```


### 7️⃣ Optional: Manual Docker build

If you'd like to build the image manually without Compose:

```bash
docker build -t laravel-app .
```

---

## 🛡️ Middleware Authentication

A simple middleware is included in `app/Http/Middleware/CheckSessionToken.php`. It expects a header named `X-Session-Token` containing a valid JWT token. The middleware decodes the token and attaches the corresponding user to the request.

---

## 📚 API Documentation

Swagger support can be added with [L5 Swagger](https://github.com/DarkaOnLine/L5-Swagger). After installing dependencies, run:

```bash
composer require darkaonline/l5-swagger
php artisan vendor:publish --provider "L5Swagger\L5SwaggerServiceProvider"
```

Then, publish the configuration and generate docs using:

```bash
php artisan l5-swagger:generate
```

---

## 📝 Notes

This project includes only the essential Laravel files. The rest of the framework and frontend tooling will be installed through `composer install` and `npm install`.

Make sure Docker is installed and running before starting development. You may create a `.dockerignore` file to reduce build context if needed.

---

## 🛠️ Using the Makefile (Optional but Recommended)

A Makefile is included to simplify repetitive development tasks. Instead of typing long `docker-compose` or Artisan commands, you can use simple shortcuts.

✅ **Make** is available by default on macOS and Linux.
🪟 On Windows, you can use it via Git Bash, WSL, or Make for Windows tools like GnuWin.

| Command              | Description                                   |
| -------------------- | --------------------------------------------- |
| `make up`            | Build and start all Docker containers         |
| `make down`          | Stop and remove all running containers        |
| `make restart`       | Restart the full Docker environment           |
| `make migrate`       | Run Laravel database migrations               |
| `make migrate-fresh` | Drop and recreate all tables (with seeding)   |
| `make seed`          | Run Laravel database seeders                  |
| `make artisan`       | Access the Artisan CLI inside the container   |
| `make npm-install`   | Install frontend dependencies inside Docker   |
| `make npm-build`     | Build the React frontend (production)         |
| `make npm-dev`       | Run Vite dev server (inside Docker)           |
| `make composer`      | Install PHP dependencies                      |
| `make test`          | Run Laravel test suite                        |
| `make shell`         | Open a shell session inside the app container |

---

## 🚀 Example Usage

```bash
make up            # Starts the full app with MySQL and phpMyAdmin
make migrate       # Runs pending Laravel migrations
make npm-build     # Builds production frontend assets
make artisan       # Lets you run artisan commands manually
```

Using the Makefile helps maintain consistency across environments and improves team productivity. You can customize it further to fit your workflow!

