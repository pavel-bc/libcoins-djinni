//
//  ViewController.m
//  TodoApp
//
//  Created by Pavel on 12/12/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

#import "ViewController.h"
#import "LibCoinsTodoList.h"
#import "TableViewCell.h"

@interface ViewController ()

@property NSMutableArray *objects;
@end

@implementation ViewController {
    LibCoinsTodoList *_todoInterface;
    NSMutableArray *_todos;
    int _newTodoCount;
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // instantiate our table view
    CGRect fr = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _tableView = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    // instantiate our Todo Library Interface with correct path
    _todoInterface = [LibCoinsTodoList create];
    
    // populate the array with our data
    NSArray *todos = [_todoInterface getTodos];
    NSLog(@"%@", todos);
    _todos = [[NSMutableArray alloc] initWithArray:todos];
    _newTodoCount = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"Cell"];
    }
    
    LibCoinsTodo *todo = _todos[indexPath.row];
    
    NSString *todoLabel = [todo label];
    cell.label.text = todoLabel;
    
    [cell.button addTarget:self action:@selector(deleteButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    cell.button.tag = [todo id];
    
    return cell;
}

- (void)deleteButtonPressed:(UIButton*)button {
    [_todoInterface deleteTodo:(int)button.tag];
    
    // get new data from database and update the table view
    _todos = [[NSMutableArray alloc] initWithArray:[_todoInterface getTodos]];
    [_tableView reloadData];
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    // get new data from database and update the table view
    _todos = [[NSMutableArray alloc] initWithArray:[_todoInterface getTodos]];
    [_tableView reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        LibCoinsTodo *todo = _todos[indexPath.row];
        int dbRow = todo.id;
        NSLog(@"delete %d", dbRow);
        [_todoInterface deleteTodo:dbRow];
        _todos = [[NSMutableArray alloc] initWithArray:[_todoInterface getTodos]];
        [_tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
