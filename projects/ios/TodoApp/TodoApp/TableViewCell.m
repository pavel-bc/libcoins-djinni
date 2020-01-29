//
//  TableViewCell.m
//  TodoApp
//
//  Created by Pavel on 12/12/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // add a label
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 1000, 50)];
        [self addSubview:self.label];
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
