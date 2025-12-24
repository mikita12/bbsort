# bbsort
BubbleSort implementation in assembly

## Requirements

GNU Assembler (as): Used for assembling the .s source file.

GNU Linker (ld): Used for linking the object file into an ELF executable.

make: For automating the compilation and execution process.

hexdump: For visualizing the sorted output data.

## Building and Running

The project includes a `Makefile` that automates the assembly, linking, execution, and output display process.

### 1. Building

Use the `all` target in the `Makefile` to compile, link, run the program, and display the result:

```bash
make all
