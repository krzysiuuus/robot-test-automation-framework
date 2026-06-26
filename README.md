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
* ChromeDriver
* Page Object Pattern
* Git
* GitHub

---

# Features

* Page Object Pattern architecture
* End-to-end UI automation
* Dynamic test data
* Dynamic date generation
* Shared configuration management
* Reusable Robot Framework resources
* Externalized test data
* Config management
* Cross-page reusable keywords

---

# Architecture

The framework is based on the Page Object Pattern design pattern.

Implemented architecture includes:

* reusable page resources
* centralized configuration
* separated test data
* reusable browser management
* reusable utility resources
* dynamic date generation
* clear separation between tests, pages and data

---

# Project Structure

```text
robot-test-automation-framework/
├── config/
│   └── config.robot
│
├── page_object_pattern/
│   ├── data/
│   ├── pages/
│   ├── resources/
│   └── tests/
│
├── results/
├── .gitignore
└── README.md
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

Run all tests:

```bash
robot -d results page_object_pattern/tests
```

Run selected test:

```bash
robot -d results page_object_pattern/tests/test_flight_search.robot
```

---

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

* Browser Factory
* GitHub Actions
* Jenkins Pipeline
* Screenshot on failure
* Allure Reports
* Retry mechanism
* Cross-browser execution
* Selenium Grid
* Remote WebDriver execution
* Parallel execution

---

# Author

Created by [krzysiuuus](https://github.com/krzysiuuus)
