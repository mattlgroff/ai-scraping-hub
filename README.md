# AI Scraping Hub

## Prerequisites

- Ruby v3.2.2
- Docker

## Running locally

Make a `.env` file in the root of the project.
  
```bash
DATABASE_URL=postgres://postgres:mysecretpassword@localhost:5432/ai-scraping-hub
```

See the `.example.env` for the required variables to get running.

Install dependencies.

```bash
  gem install bundler
  gem install rails
  gem install pg
  bundle install
```

So get thing's started with Docker Compose (recommended) you can run:

```bash
  docker compose up
```

Docker Compose will spin up 3 containers: `rails`, `redis`, and `postgres`. It you go into Docker Desktop you should see something like this:

| Name | Image | Ports |
| ---- | ----- | ----- |
| ai-scraping-hub | - | - |
| redis | redis | 6379:6379 |
| postgres | postgres | 5432:5432 |
| rails | ai-scraping-hub-rails | 3000:3000 |

To access the Rails app visit [http://localhost:3000](http://localhost:3000)

Any changes you make should live-reload as you make them. 