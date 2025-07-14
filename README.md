# Laravel Backend Dashboard

This repository contains a minimal Laravel setup meant to be used with a React
frontend. Authentication is handled on the frontend and a session token is sent
with every request. The backend only needs to verify this token and determine
the logged in user through middleware.

---

## 🧰 Tech Stack

- ⚙️ Laravel 10+ (PHP 8.2 FPM)
- ⚛️ React (via Vite)
- 🐬 MySQL 8
- 🐘 phpMyAdmin
- 🐳 Docker & Docker Compose

---

## 📦 Getting Started

### 1️⃣ Install dependencies

Run inside the project directory:

```bash
composer install
npm install
```

   After installing, commit the generated `composer.lock` and
   `package-lock.json` files so that everyone uses the same versions.

   The included `Dockerfile` is based on `php:8.2-fpm-alpine` and installs
   Node.js `20.11.1`.

2. Copy `.env.example` to `.env` and adjust your configuration.

2️⃣ Configure environment variables

```bash
cp .env.example .env
```

Configure your `.env` file to point to your external PostgreSQL server. Set
`DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME` and `DB_PASSWORD` with the
connection details.

3️⃣ Start the Docker environment

```bash
docker-compose up -d --build
```

4️⃣ Access phpMyAdmin
You can access the database visually at:

🔗 http://localhost:8080

Use the following login credentials (from your .env):

Server: db

Username: ${DB_USERNAME} (default: laraveluser)

Password: ${DB_PASSWORD} (default: laravelpass)

➡️ Make sure the database name in .env exists (DB_DATABASE), or create it via phpMyAdmin before running migrations.

5️⃣ Run database migrations

Once your containers are running and the database exists, execute:

```bash
docker-compose exec app php artisan migrate
```

6️⃣ Optional: Manual Docker build

If you'd like to build the image manually without Compose:

```bash
docker build -t laravel-app .
```

🛡️ Middleware Authentication

A simple middleware is included in `app/Http/Middleware/CheckSessionToken.php`.
It expects a header named `X-Session-Token` containing a valid JWT token. The
middleware decodes the token and attaches the corresponding user to the request.

📚 API Documentation

Swagger support can be added with [L5 Swagger](https://github.com/DarkaOnLine/L5-Swagger).
After installing dependencies, run:

```bash
composer require darkaonline/l5-swagger
php artisan vendor:publish --provider "L5Swagger\L5SwaggerServiceProvider"
```

Then publish the configuration and generate docs using:

```bash
php artisan l5-swagger:generate
```

📝 Notes

This project includes only the essential Laravel files.

The rest of the framework and frontend tooling will be installed through composer install and npm install.

Make sure Docker is installed and running before starting development.

You may create a .dockerignore file to reduce build context if needed.


🛠️ Using the Makefile (Optional but Recommended)

A Makefile is included to simplify repetitive development tasks. Instead of typing long docker-compose or Artisan commands, you can use simple shortcuts.

✅ Make is available by default on macOS and Linux.
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

🚀 Example Usage

```bash
make up            # Starts the full app with MySQL and phpMyAdmin
make migrate       # Runs pending Laravel migrations
make npm-build     # Builds production frontend assets
make artisan       # Lets you run artisan commands manually
```

Using the Makefile helps maintain consistency across environments and improves team productivity.
You can customize it further to fit your workflow!

