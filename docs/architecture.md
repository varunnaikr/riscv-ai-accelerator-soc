# SoC Architecture

The system integrates a RISC-V compatible processor with a custom AI accelerator.

## Architecture Overview
       +--------------------+
       |      RISC-V CPU    |
       +---------+----------+
                 |
             System Bus
                 |
 +---------------+----------------+
 |                                |
       +--------+ +-------------+
     | Memory | | AI Accelerator|
       +--------+ +-------------+
|
         +--------------+
         | Systolic Array|
         +--------------+

The CPU controls the accelerator through the system bus while the accelerator performs matrix multiplication using a systolic array architecture.
