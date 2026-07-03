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

Tests
↓
Page Objects
↓
Element Actions
↓
SeleniumLibrary
↓
WebDriver

---

# Project Structure

```text
robot-test-automation-framework/
│
├── .github/
│   └── workflows/
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

---

# Docker

Build image and run:

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

# Configuration 

The framework supports runtime configuration through Robot Framework variables.

Available options:

- BROWSER=Chrome
- BROWSER=Firefox
- BROWSER=Edge
- HEADLESS=True

Variables can be overridden directly from the command line:

```bash
robot -v BROWSER:Firefox -v HEADLESS:True page_object_pattern/tests
```

# Current Test Scenarios

The framework currently contains automated UI tests for:

* Flight Search
* Hotel Search
* Create Account
* Login Validation
* Update Billing Address

---

# Planned Features

The project is being developed incrementally.

Next planned improvements:

* Selenium Grid
* Remote WebDriver execution
* Parallel execution
* Jenkins Pipeline
* Browser matrix execution

---

# Author

Created by [krzysiuuus](https://github.com/krzysiuuus)
