package com.blockchain.demoapp;

import com.blockchain.libcoins.Todo;
import com.blockchain.libcoins.TodoList;

import android.app.ListActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends ListActivity {

    private TodoList todoListInterface;
    private List<String> listValues;
    ArrayList<Todo> todos;

    static {
        System.loadLibrary("coins_jni");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        listValues = new ArrayList<String>();
        todoListInterface = TodoList.create();
        refreshList();
    }

    protected void refreshList() {
        todos = todoListInterface.getTodos();
        listValues = new ArrayList<String>();

        for (int i = 0; i < todos.size(); i++) {
            Todo todo = todos.get(i);
            listValues.add(todo.getLabel());
        }

        ArrayAdapter<String> myAdapter = new ArrayAdapter <String>(this,
                R.layout.row_layout, R.id.listText, listValues);
        setListAdapter(myAdapter);
    }


    // when an item of the list is clicked
    @Override
    protected void onListItemClick(ListView list, View view, int position, long id) {
        super.onListItemClick(list, view, position, id);
        Todo selectedTodo = (Todo) todos.get(position);
        refreshList();
    }

    public void addButtonPressed(View view) {
        refreshList();
    }

    public void deleteButtonPressed(View view) {
        refreshList();
    }
}
