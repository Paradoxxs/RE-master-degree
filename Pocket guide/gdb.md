
Common commands

| Command           | Description                                                            | Syntax                            |
|-------------------|------------------------------------------------------------------------|-----------------------------------|
| break             | Sets a breakpoint at a specified location in the program                | `break <location>` e.g. `break main` or `break *address`                 |
| run               | Starts or restarts the execution of the program                        | `run`                             |
| next              | Executes the next line of code, stepping over function calls           | `next`                            |
| step              | Executes the next line of code, stepping into function calls           | `step`                            |
| continue          | Resumes program execution until the next breakpoint is reached          | `continue`                        |
| print             | Displays the value of a variable or expression                          | `print <variable/expression>`      |
| backtrace         | Prints a backtrace of the function call stack                           | `backtrace`                       |
| info locals       | Displays the values of local variables in the current scope             | `info locals`                     |
| info breakpoints  | Shows information about defined breakpoints                            | `info breakpoints`                |
| delete            | Deletes a specified breakpoint                                         | `delete <breakpoint number>`       |
| watch             | Sets a watchpoint on a variable, triggering a break when its value changes | `watch <variable>`              |
| stepi             | Steps one machine instruction at a time                                 | `stepi`                           |
| finish            | Runs the program until the current function is finished                 | `finish`                          |
| set variable      | Modifies the value of a variable                                        | `set variable <variable> = <value>`|
| layout            | Controls the display layout of GDB                                      | `layout <layout-name>`             |
| file              | Specifies the executable file to debug                                  | `file <executable>`                |
| quit              | Exits GDB                                                               | `quit`                            |

These commands should give you a good starting point for debugging your program using GDB. Remember to consult the GDB documentation for more detailed information and additional commands.