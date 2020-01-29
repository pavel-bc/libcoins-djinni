#pragma once

#include "todo_list.hpp"
#include "todo.hpp"
 
namespace libcoins {
 
    class TodoListImpl : public TodoList {
 
    public:
 
        // Constructor
        TodoListImpl();
        
        // Database functions we need to implement in C++
        std::vector<Todo> get_todos();
        bool delete_todo(int32_t id);

    private:
        void example_private_function();

    };
 
}
