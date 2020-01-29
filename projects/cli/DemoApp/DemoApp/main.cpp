#include <iostream>
#include "todo.hpp"

#include <stdio.h>
#include <string>
#include "todo_list_impl.hpp"

void print_todos(libcoins::TodoListImpl tdl) {
    std::vector<libcoins::Todo> todos = tdl.get_todos();
    for (auto & element : todos) {
        std::cout << element.id << ". " << element.label << " (" << element.completed << ")\n";
    }
}

int main(int argc, char **argv) {
    // instantiate our C++ implementation
    libcoins::TodoListImpl tdl = libcoins::TodoListImpl();
    
    // print the initial mnemonic
    print_todos(tdl);
    
    return 0;
}
