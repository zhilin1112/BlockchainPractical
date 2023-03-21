//SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;
// purpose to record task per week

contract Todos {
    
    struct Todo {  // Todo structure has text and complete
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todosChawTask; // todo child task is an array
    // size is not initialized
    // Your program will be excecuted by diffrent miner/user

    function createFirstTask(string memory _text) public {
        // 3 ways to initialize a struct
        
       // Method 1: -***calling it like a function***-
        
        todosChawTask.push(Todo(_text, false));

        // method 1 the order of the input parameter as the struct
        // push is to add data to the child task
        // index is 0, if a new task added it will be add on follow the sequence
        // why false because haven't complete yet
/*
        // Method 2: -***key value mapping***-

        todosChawTask.push(Todo({text: _text, completed: false }));
        // similler as the method 1
        // the diffrent is to include a bracket to indicate store the data in the struct
        // for example store _text to text and store false to completed

        // Method 3:-***initialize an struct and then update it***-

        Todo memory todo; // memory is use because it is a temporary store data
        // a new variable todo is created which as the same data type as Todo
        todo.text = _text;
      
        // store _text and store in todo.text
        // todo.completed initialized to false
        todosChawTask.push(todo);
        // todo is push to todosChawTask */ 
    } 
     
// Solidity automatically created a getter for' todos' so
    // you don't actually need this function.

    function get(uint _index) public view returns (string memory text, bool completed){
        Todo storage todo = todosChawTask[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateNewTask(uint _index, string memory _text) public {
        Todo storage todo = todosChawTask[_index];
        todo.text = _text;
    }
    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todosChawTask[_index];
        todo.completed = !todo.completed;
    }
}