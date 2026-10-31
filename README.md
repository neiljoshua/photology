# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Photology - Legacy Portfolio Project

A Ruby on Rails photography application using HAML templates and Paperclip for local asset processing.

## 🛠️ Apple Silicon (M3 Mac) Environment Requirements

This project runs on an older framework version and requires explicit system environment configuration to boot cleanly on modern Apple Silicon hardware.

### 1. Hard Dependencies (Homebrew)
Ensure the following packages are compiled on your Mac:
```bash
brew install mysql
brew install imagemagick
brew install shared-mime-info
```

### 2. Core Boot Patches (`config/boot.rb`)
To bypass `ActiveSupport` name resolution crashes and the removal of `URI.escape` in Ruby 3.x, ensure the following hooks load before `bundler/setup`:
```ruby
require 'logger'
require 'uri'

unless URI.respond_to?(:escape)
  module URI
    def self.escape(*args)
      DEFAULT_PARSER.escape(*args)
    end
  end
end
```

### 3. Local MySQL User Configuration
The application requires the legacy `mysql_native_password` plugin to authenticate successfully with the database server:
```sql
CREATE USER IF NOT EXISTS 'phadmin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'phadmin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

### 4. Paperclip Processing Paths
To allow Paperclip to process image styles via Homebrew on an M3 architecture, verify that `config/environments/development.rb` contains:
```ruby
Paperclip.options[:command_path] = "/opt/homebrew/bin/"
```

## 🚀 Local Development Commands

- **Bypass Spring Server:** `export DISABLE_SPRING=true`
- **Initialize Database Containers:** `bundle exec rails db:create`
- **Run Structural Blueprints:** `bundle exec rails db:migrate`
- **Launch Local Application:** `bundle exec rails server`
