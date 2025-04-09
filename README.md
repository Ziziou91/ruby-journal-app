# Ruby Journal App

The Ruby Journal App is a simple journal application that allows users to create, edit, and share journal entries. It includes user authentication, entry sharing, and role-based access control.

---

## Features

- **User Authentication**: Users can log in and manage their own entries.
- **Entry Management**: Create, edit, view, and delete journal entries.
- **Shared Entries**: Share entries with other users for collaboration or read-only access.
- **Role-Based Access**: Users can only edit or delete their own entries, while shared entries are read-only.

---

## Setup Instructions

Follow these steps to set up the Ruby Journal App on your local machine:

### 1. Clone the Repository
```bash
git clone <repository-url>
cd ruby-journal-app
```
### 2. Install Dependencies
Ensure you have the following installed:

- Ruby: Version 3.x or higher
- Rails: Version 7.x or higher
- PostgreSQL: Ensure PostgreSQL is installed and running

Install the required gems:
```bash
bundle install
```

### 3. Set Up the Database
Create and migrate the database:
```bash
rails db:create
rails db:migrate
```

Seed the database with test data:
```bash
rails db:seed
```

### 4. Start the Rails Server
Run the Rails server:
```bash
rails server
```

Visit the application in your browser at: http://localhost:3000

## Dependencies
The Ruby Journal App relies on the following dependencies:

- Ruby on Rails: Web application framework
- PostgreSQL: Database for storing user and entry data
- Devise: User authentication
- Bootstrap: Frontend styling
- Simple Form: Simplified form generation
- RSpec: Testing framework (optional for development)

## Testing the Application
### Test User Accounts
The application includes seeded user accounts for testing. These can be found in `seeds.rb`

### Running Tests
Run the test suite using RSpec:
```bash
bundle exec rspec
```

## License
This project is licensed under the MIT License. See the LICENSE file for details.
