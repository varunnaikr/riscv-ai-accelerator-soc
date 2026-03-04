# Systolic Array Accelerator

The accelerator implements a **systolic array architecture** for efficient matrix multiplication.

## Processing Element (PE)

Each PE performs:

- Multiply operation
- Accumulate operation
- Data forwarding to neighboring PEs

## Data Flow
Matrix A →→→
PE → PE → PE
Matrix B ↓
PE → PE → PE
Matrix B ↓
PE → PE → PE

Data flows rhythmically through the array enabling highly parallel computation.
