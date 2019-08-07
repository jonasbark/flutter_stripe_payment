//
//  STPAddSourceViewController.m
//  Runner
//
//  Created by Jonas Bark on 06.11.17.
//  Copyright © 2017 The Chromium Authors. All rights reserved.
//

#import "STPAddSourceViewController.h"

@interface STPAddSourceViewController ()

@end

@implementation STPAddSourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem.leftBarButtonItem setTarget:self];
    [self.navigationItem.leftBarButtonItem setAction:@selector(cancelClicked:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cancelClicked:(id)sender {
    [self.srcDelegate addCardViewControllerDidCancel:self];
}

-(void)nextPressed:(id)sender {
    
    //TODO hackedihack
    STPPaymentCardTextField* paymentCell = [((UITableView*)self.view.subviews.firstObject) cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].subviews.firstObject.subviews.firstObject;
    
    STPAPIClient *apiClient = [[STPAPIClient alloc] initWithConfiguration:[STPPaymentConfiguration sharedConfiguration]];

    STPPaymentMethodCardParams *cardParams = paymentCell.cardParams;
    STPCardParams *stpCardParams = [[STPCardParams alloc] init];

    stpCardParams.number = cardParams.number;
    stpCardParams.expMonth = cardParams.expMonth.integerValue;
    stpCardParams.expYear = cardParams.expYear.integerValue;
    stpCardParams.cvc = cardParams.cvc;

    STPSourceParams *sourceParams = [STPSourceParams cardParamsWithCard:stpCardParams];
    if (cardParams) {
        [apiClient createSourceWithParams:sourceParams completion:^(STPSource *source, NSError *tokenError) {
            if (tokenError) {
                [self performSelector:@selector(handleError:) withObject:tokenError afterDelay:0];
            }
            else {
                [self.srcDelegate addCardViewController:self didCreateSource:source completion:^(NSError * _Nullable error) {
                }];
            }
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
