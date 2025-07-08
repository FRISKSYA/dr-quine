# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a 42Tokyo Dr. Quine project. The Dr. Quine project involves creating self-replicating programs (quines) in C. A quine is a program that produces its own source code as its output.

## Project Structure

The repository is currently in initial setup phase. Based on the .gitignore file, this will be a C/C++ project. The project specification is in `dr-quine.pdf`.

## Expected Implementation

The Dr. Quine project typically consists of three programs:

1. **Colleen**: A simple quine that prints its own source code
2. **Grace**: A quine that writes its source code to a file
3. **Sully**: A quine that creates copies of itself with decreasing iteration counts

## Build Commands

Since no Makefile exists yet, you'll need to compile C files manually:
```bash
# Compile a C file
gcc -Wall -Wextra -Werror -o program_name source.c

# For example:
gcc -Wall -Wextra -Werror -o Colleen Colleen.c
gcc -Wall -Wextra -Werror -o Grace Grace.c
gcc -Wall -Wextra -Werror -o Sully Sully.c
```

## Development Guidelines

1. Follow 42's coding norm (if applicable)
2. Use the flags `-Wall -Wextra -Werror` for compilation
3. Each program should be self-contained in a single C file
4. The programs must compile and run on macOS (based on platform: darwin)

## Testing

To test the quines:
```bash
# For Colleen (should output its own source):
./Colleen > tmp.c && diff Colleen.c tmp.c

# For Grace (should create Grace_kid.c):
./Grace && diff Grace.c Grace_kid.c

# For Sully (should create decreasing copies):
./Sully
```

## Important Notes

- Quines are programs that reproduce their own source code
- String escaping and proper formatting are crucial
- The programs should handle their own source code as data within the program