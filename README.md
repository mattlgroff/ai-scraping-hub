# AI Scraping Hub

## Prerequisites

- Ruby v3.2.2
- Docker

## Running locally

Make a `.env` file in the root of the project.
  
```bash
DATABASE_URL=postgres://postgres:mysecretpassword@localhost:5432/ai-scraping-hub
SECRET_KEY_BASE=0111a7892a0296e3b23e3be54c0fb17a5b95e55cefce832d3d525f4d54fa7710cda64df1cc986a5953769bf0ef7f93992f62b0cf4032f1196ca9e60c5432c1f7
```

See the `.example.env` for the required variables to get running. Note the above are just examples and you will need to provide them yourself.

You can generate a `SECRET_KEY_BASE` by running:

```bash
  rails secret
```

You can generate a `RAILS_MASTER_KEY` by running:

```bash
  rails credentials:edit
```

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