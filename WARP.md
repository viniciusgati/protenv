# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Common commands

- Setup local dev (installs gems, prepares DB, clears logs, starts server):
  ```bash path=null start=null
  bin/setup
  ```
- Start server (without setup):
  ```bash path=null start=null
  bin/dev
  ```
- Database prep/seed:
  ```bash path=null start=null
  bin/rails db:prepare
  bin/rails db:seed
  ```
- Console / Rake:
  ```bash path=null start=null
  bin/rails console
  bin/rake -T
  ```
- Lint (Rubocop Rails Omakase rules, used in CI):
  ```bash path=null start=null
  bin/rubocop
  ```
- Security scan (Brakeman, used in CI):
  ```bash path=null start=null
  bin/brakeman --no-pager
  ```
- Run tests (RSpec + SimpleCov):
  ```bash path=null start=null
  bundle exec rspec                # all tests
  bundle exec rspec spec/models/user_spec.rb              # single file
  bundle exec rspec spec/models/user_spec.rb:12           # single example by line
  ```
- Build and run production container (uses Dockerfile and Thruster entrypoint):
  ```bash path=null start=null
  docker build -t rails_devise_auth .
  docker run -d -p 80:80 -e RAILS_MASTER_KEY={{RAILS_MASTER_KEY}} --name rails_devise_auth rails_devise_auth
  ```

## High-level architecture

- Framework and runtime
  - Ruby on Rails 8 (Ruby 3.4.7). SQLite is used for development/test. Assets via Propshaft.
  - “Solid” adapters included and configured: Solid Cache, Solid Queue, Solid Cable (see `config/cache.yml`, `config/queue.yml`, `config/cable.yml`).
  - Production image uses Thruster to front Puma; Kamal files are present for container-based deploys.

- Authentication (Devise)
  - `User` model (`app/models/user.rb`) uses Devise modules: `database_authenticatable`, `registerable`, `recoverable`, `rememberable`, `validatable`.
  - Routes include `devise_for :users` (`config/routes.rb`). Default Devise initializer is present (`config/initializers/devise.rb`).
  - Layout renders auth links and logout button via Devise helpers (`app/views/layouts/application.html.erb`).

- Web layer
  - `HomeController#index` with root route to `home#index`. Basic view scaffold (`app/views/home/index.html.erb`).
  - `ApplicationController` restricts to modern browsers via `allow_browser versions: :modern`.

- Testing
  - RSpec configured with `spec_helper.rb` and `rails_helper.rb`. Support files in `spec/support/**` are auto-required.
  - Capybara defaults to `:rack_test` for system specs; Devise integration helpers included for request/system specs.
  - SimpleCov enforces 100% minimum coverage for the suite.

- Tooling & CI
  - Lint: Rubocop (Rails Omakase) via `bin/rubocop`. Security scan: Brakeman via `bin/brakeman`.
  - CI workflow runs Brakeman and Rubocop (see `.github/workflows/ci.yml`).
  - Tool versions: `.ruby-version` and `.tool-versions` pin Ruby (3.4.7), Node (24.10.0), Yarn (1.22.22).

## Notes for agents

- When adding or modifying models/migrations, run `bin/rails db:prepare` before executing tests or starting the server.
- System tests run without a JS driver by default; if you add JS-dependent tests, you must configure a Capybara driver accordingly.
- Given SimpleCov’s 100% coverage threshold, add or adjust specs alongside code changes to keep CI/local runs green.
