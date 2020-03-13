//
//  TextFieldObjCViewController.m
//  AndesUI-demoapp
//
//  Created by Martin Damico on 13/03/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "TextFieldObjCViewController.h"

#import <AndesUI-Swift.h>

@interface TextFieldObjCViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation TextFieldObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void) handleActionTap:(AndesMessage*)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Action Pressed"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:nil];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)setup {
    __weak typeof(self) weakSelf = self;

    _stackView.translatesAutoresizingMaskIntoConstraints = false;
    AndesTextField* view = [[AndesTextField alloc] initWithState:AndesTextFieldStateIdle type:AndesTextFieldTypeSingleLine title:@"Message title" body:@"Message body\nSuccess - Quiet"];
    [_stackView addArrangedSubview:view];
    [view.widthAnchor constraintEqualToAnchor:_stackView.widthAnchor].active = YES;
    
    /*
    view = [[AndesTextField alloc] initWithState:AndesTextFieldStateIdle type:AndesTextFieldTypeSingleLine title:@"Message title" body:@"Message body\nNeutral - Quiet - With Actions"];
    [_stackView addArrangedSubview:view];
    [view.widthAnchor constraintEqualToAnchor:_stackView.widthAnchor].active = YES;
    
    view = [[AndesMessage alloc] initWithHierarchy:AndesTextFieldStateError type:AndesTextFieldTypeSingleLine title:@"" body:@"Message Without title\nError - Quiet"];
    [view setPrimaryAction:@"Just Primary" handler: ^(AndesMessage* message){
        [weakSelf handleActionTap:message];
    }];
    [_stackView addArrangedSubview:view];
    [view.widthAnchor constraintEqualToAnchor:_stackView.widthAnchor].active = YES;
    
    view = [[AndesTextField alloc] initWithHierarchy:AndesTextFieldStateDisabled type:AndesTextFieldTypeSingleLine title:@"Message title" body:@"Message body\nWarning - Loud"];
    [_stackView addArrangedSubview:view];
    [view.widthAnchor constraintEqualToAnchor:_stackView.widthAnchor].active = YES;
    */
}

@end

