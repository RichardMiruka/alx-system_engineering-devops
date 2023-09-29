# Processes and signals
DevOps
Shell
Bash
Syscall
Scripting
### Processes:
In computing, a process is a program in execution. It represents a unit of work that the operating system manages. When you run a program on your computer, it creates a process. A process includes the program code, its data, and the resources (such as memory, CPU time, files, etc.) it needs to execute.

Key aspects of a process include: 
* Memory Space: A process has its own memory space, allowing it to run independently without interfering with other processes.
* Execution State: The current state of the program, including the values of variables, registers, and the program counter.
* Resources: Processes have access to various resources such as file handles, network connections, and input/output streams.

Processes enable concurrent execution, enabling multiple programs to run simultaneously, which is essential for multitasking operating systems.

### Signals:

In the context of operating systems and programming, a signal is a software interrupt delivered to a process, indicating an event that has occurred. Signals are a form of inter-process communication and are used to notify a process of various conditions, such as errors, alarms, or specific events.

Common uses of signals include:
* Error Handling: Signals can be used to notify a process of an error condition, allowing the program to take appropriate actions.
* Termination: Signals can instruct a process to terminate gracefully.
* User Interaction: Signals can be triggered by user actions, like pressing Ctrl+C to interrupt a running program.
  
Each signal has a unique identifier and a predefined meaning, and it can be caught and handled by the process or allowed to take its default action.

## Resources
* [Linux PID](https://intranet.alxswe.com/rltoken/qVGxUt1QMIV4B4oVrQBlQg)
* [Linux process](https://intranet.alxswe.com/rltoken/px2TdWSjVO8i9SB5gHchAw)
* [Linux signal](https://intranet.alxswe.com/rltoken/qQSGz9CN52PVF3IPCuaRiw)
* [Process management in linux](https://intranet.alxswe.com/rltoken/XlYrlghzNZ6Z1cbI_IPaiA)

  ## Learning Objectives
- What is a PID
- What is a process
- How to find a process’ PID
- How to kill a process
- What is a signal
- What are the 2 signals that cannot be ignored

 [more about Signals](https://intranet.alxswe.com/rltoken/BOU-KVNMqfKEIBo_VOI26A)
 [ignoring shellcheck error here](https://intranet.alxswe.com/rltoken/vErRT8QGU2bwJ6FLvPLzxw)

### man or help:

- ps
- pgrep
- pkill
- kill
- exit
- trap
