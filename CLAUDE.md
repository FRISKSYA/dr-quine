# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a 42Tokyo Dr. Quine project. The Dr. Quine project involves creating self-replicating programs (quines) in C. A quine is a program that produces its own source code as its output.

## Project Structure

The repository is currently in initial setup phase. Based on the .gitignore file, this will be a C/C++ project. The project specification is in `dr-quine.pdf`.

## Expected Implementation

The Dr. Quine project consists of three programs with specific requirements:

### 1. **Colleen**: Basic quine that prints to stdout
- Prints its own source code to standard output
- **Mandatory requirements:**
  - Must have a `main` function
  - Must have 2 different comments:
    - One comment INSIDE the main function
    - One comment OUTSIDE the program
  - Must have at least one additional function (besides main) that is called
  
### 2. **Grace**: File-writing quine
- Creates a file named `Grace_kid.c` containing its own source code
- **Mandatory requirements:**
  - NO declared main function
  - Exactly 3 #define statements only
  - Exactly 1 comment
  - Program runs by calling a macro

### 3. **Sully**: Self-replicating quine with counter
- Creates `Sully_X.c` where X is an integer
- Compiles and executes the created file
- **Mandatory requirements:**
  - Integer starts at 5
  - Each execution decrements the integer
  - Stops when integer < 0
  - Must compile and execute the generated files automatically

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

## Project Constraints

**IMPORTANT: The following are considered cheating and are strictly prohibited:**
- Reading the source file directly (e.g., using fopen to read the .c file)
- Using argv/argc in any way
- Any form of external data input

**Additional Requirements:**
- Programs must handle errors carefully and never crash unexpectedly (no segfaults, bus errors, double frees, etc.)
- Must use C and Assembly (though validation is possible with C part only)
- Each program must be in separate folders named C and ASM with their own Makefiles
- Makefiles must contain usual rules and only recompile when necessary

## CRITICAL IMPLEMENTATION RULES FOR CLAUDE

**BEFORE implementing any quine solution, you MUST:**
1. NEVER use `fopen()`, `open()`, or any file reading functions to read the source file
2. NEVER use `argv[0]` or any command line arguments
3. NEVER use `__FILE__` macro or similar preprocessor tricks to get the filename
4. The quine must be self-contained - the source code must exist as a string within the program itself

**Valid quine techniques include:**
- Storing the program's source as a string literal within the program
- Using printf with careful escaping to reproduce the source
- Using macros and string manipulation to construct the output

**Before writing any code, explicitly confirm:**
- "I will not read any files"
- "I will not use argv/argc"
- "The source code will be embedded as data within the program"

**Testing verification:**
- Always test by compiling and running the program in a different directory
- Ensure the program works even if the source file is deleted after compilation
- The output must be byte-for-byte identical to the source file