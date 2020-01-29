#include <iostream>
#include <string>
#include <vector>

#include "todo_list_impl.hpp"
#include "bip39.h"
  
namespace libcoins {

    std::shared_ptr<TodoList> TodoList::create() {
        return std::make_shared<TodoListImpl>();
    }

    TodoListImpl::TodoListImpl() {
        // Dummy constructor
    }
  
    std::vector<Todo> TodoListImpl::get_todos() {
        // Generate mnemonic
        const char* mnemonic = mnemonic_generate(192);
        std::string s(mnemonic);

        // Split words
        std::vector<std::string> output;
        std::string::size_type prev_pos = 0, pos = 0;

        while((pos = s.find(' ', pos)) != std::string::npos)
        {
            std::string substring(s.substr(prev_pos, pos-prev_pos));
            output.push_back(substring);
            prev_pos = ++pos;
        }

        output.push_back(s.substr(prev_pos, pos-prev_pos));
        
        // Append to structures
        std::vector<Todo> todos;
        int size = static_cast<int>(output.size());
        for (int i = 0; i < size; i++) {
            Todo temp_todo = {
                i,
                output[i],
                0
            };
            todos.push_back(temp_todo);
        }
        
        return todos;
    }

    
    bool TodoListImpl::delete_todo(int32_t id) {
        return id;
    }
    
    void TodoListImpl::example_private_function() {
        return;
    }
}
