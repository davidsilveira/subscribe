# Sales Taxes Calculator

A small Ruby application that calculates sales taxes for shopping baskets according to the following rules:

- Basic sales tax: **10%**
- Books, food, and medical products are exempt from basic sales tax
- Imported products have an additional **5% import duty**
- Taxes are rounded up to the nearest **0.05**

The application reads a shopping basket from a text file and prints a receipt containing:

- each product with its final price including taxes
- total sales taxes
- total purchase amount

## Requirements

The only requirement is:

- Docker

No local Ruby installation is required.

## Build

Build the Docker image:

```bash
docker build -t sales-taxes .
```

## Usage

Run the application using one of the provided input files:

```bash
docker run --rm sales-taxes ruby bin/receipt ./fixtures/input1.txt
```

```bash
docker run --rm sales-taxes ruby bin/receipt ./fixtures/input2.txt
```

```bash
docker run --rm sales-taxes ruby bin/receipt ./fixtures/input3.txt
```

### Example

Input:

```text
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

Output:

```text
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

## Tests

Run the test suite inside Docker:

```bash
docker run --rm sales-taxes rspec
```

## Assumptions

- Monetary calculations avoid floating-point arithmetic where possible to prevent precision issues.
- Product tax exemptions are determined according to the categories defined by the exercise.
- Invalid input is considered outside the expected input format of the challenge.

This project does not use Rails or any other application framework.
Code was written in plain Ruby without AI conding agent.

