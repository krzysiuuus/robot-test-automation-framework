# Robot Framework Test Automation Framework

![Robot Framework Tests](https://github.com/krzysiuuus/robot-test-automation-framework/actions/workflows/robot-tests.yml/badge.svg)

Automated UI test framework created with Robot Framework and SeleniumLibrary.

The project is a Robot Framework equivalent of my Python Test Automation Framework. It demonstrates how the same automation architecture can be implemented using Robot Framework while following its best practices.

The framework contains end-to-end UI automated tests based on the Page Object Pattern.

---

# Technologies

* Robot Framework
* SeleniumLibrary
* Selenium WebDriver
* Selenium Grid
* Remote WebDriver
* RequestsLibrary
* JSONLibrary
* REST API Testing
* Page Object Pattern
* Git
* GitHub Actions
* Allure Report
* Python
* Docker
* Docker Compose

---

# Features

* Page Object Pattern architecture
* Reusable Element Actions layer
* End-to-end UI automation
* Dynamic test data
* Dynamic date generation
* Shared configuration management
* Reusable Robot Framework resources
* Externalized test data
* Centralized browser management
* Cross-browser execution (Chrome, Firefox, Edge)
* Local and Remote execution
* Selenium Grid support
* Remote WebDriver support
* REST API automation
* Reusable API keywords
* CRUD API operations (GET, POST, PUT, DELETE)
* JSONPath response validation
* Response time validation
* Headless execution
* Screenshot on failure
* Retry mechanism
* Allure Report integration
* GitHub Actions CI/CD
* Docker support
* Docker Compose support

---

# Architecture

The framework follows the Page Object Pattern and introduces an additional abstraction layer responsible for browser interactions.

Architecture layers:

UI Tests
    ↓
Page Objects
    ↓
Element Actions
    ↓
SeleniumLibrary
    ↓
WebDriver

API Tests
    ↓
API Keywords
    ↓
RequestsLibrary
    ↓
REST API

---

# Project Structure

```text
robot-test-automation-framework/
│
├── .github/
│   └── workflows/
│
├── api_tests/
│   ├── data/
│   ├── resources/
│   └── tests/
│
├── config/
│
├── page_object_pattern/
│   ├── data/
│   ├── pages/
│   ├── resources/
│   └── tests/
│
├── results/
├── Dockerfile
├── docker-compose.yml
├── docker-compose-grid.yml
├── requirements.txt
├── README.md
└── .gitignore
```

---

# Installation

Clone repository:

```bash
git clone https://github.com/krzysiuuus/robot-test-automation-framework.git
cd robot-test-automation-framework
```

Create virtual environment:

```bash
python -m venv venv
```

Activate virtual environment:

Windows

```bash
venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

---

# Running Tests

### Run all tests

Chrome

```bash
robot -d results -v BROWSER:Chrome page_object_pattern/tests
```

Firefox

```bash
robot -d results -v BROWSER:Firefox page_object_pattern/tests
```

Edge

```bash
robot -d results -v BROWSER:Edge page_object_pattern/tests
```

Run single test

```bash
robot -d results page_object_pattern/tests/test_flight_search.robot
```

Run tests in headless mode

```bash
robot -d results \
-v BROWSER:Chrome \
-v HEADLESS:True \
page_object_pattern/tests
```

Run tests with Allure

```bash
robot -d results \
--listener allure_robotframework \
page_object_pattern/tests
```

Run tests with Retry

```bash
robot -d results \
--listener RetryFailed:1 \
page_object_pattern/tests
```

Run with Allure and Retry

```bash
robot -d results \
--listener allure_robotframework \
--listener RetryFailed:1 \
-v BROWSER:Chrome \
page_object_pattern/tests
```

### Remote execution (Selenium Grid)

Start Selenium Grid
```bash
docker compose -f docker-compose-grid.yml up
```

Run Chrome
```bash
robot -d results \
-v EXECUTION:REMOTE \
-v BROWSER:Chrome \
page_object_pattern/tests
```
Run Firefox
```bash
robot -d results \
-v EXECUTION:REMOTE \
-v BROWSER:Firefox \
page_object_pattern/tests
```
Run Edge
```bash
robot -d results \
-v EXECUTION:REMOTE \
-v BROWSER:Edge \
page_object_pattern/tests
```
---

## API Testing

The framework also contains API automated tests built with RequestsLibrary.

Implemented API features:

- GET requests
- POST requests
- PUT requests
- DELETE requests
- Response status validation
- JSONPath response validation
- Response time assertions
- Reusable API keywords

Run all API tests:

```bash
robot -d results api_tests/tests
```
Run single API test:

```bash
robot -d results api_tests/tests/test_get_single_user.robot
```

# Docker

Build and run containers:

```bash
docker compose up --build
```
Run tests:

```bash
docker compose up
```

Stop containers:

```bash
docker compose down
```

## Remote execution (Selenium Grid)

Start Selenium Grid

```bash
docker compose -f docker-compose-grid.yml up
```

Run in background
```bash
docker compose -f docker-compose-grid.yml up -d
```

Stop Grid
```bash
docker compose -f docker-compose-grid.yml down
```

Grid UI
```text
http://localhost:4444/ui
```

# Configuration 

The framework supports runtime configuration through Robot Framework variables.

Available options:

- BROWSER=Chrome
- BROWSER=Firefox
- BROWSER=Edge
- HEADLESS=True
- EXECUTION=LOCAL
- EXECUTION=REMOTE

Variables can be overridden directly from the command line:

```bash
robot -v BROWSER:Firefox -v HEADLESS:True page_object_pattern/tests
```

Example of remote execution:

```bash
robot -v EXECUTION:REMOTE -v BROWSER:Chrome page_object_pattern/tests
```
```md
Available API configuration:

- API_BASE_URL
- REQRES_BASE_URL
- REQRES_API_KEY
```

# Current Test Scenarios

## UI

- Flight Search
- Hotel Search
- Create Account
- Login Validation
- Update Billing Address

## API

- GET User
- Create Post
- Update Post
- Delete Post

---

# Planned Features

The project is being developed incrementally.

Next planned improvements:

* JSON Schema Validation
* Parallel execution
* Jenkins Pipeline
* Browser matrix execution

---

# Author

Created by [krzysiuuus](https://github.com/krzysiuuus)
