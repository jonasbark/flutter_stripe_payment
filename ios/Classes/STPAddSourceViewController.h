//
//  STPAddSourceViewController.h
//  Runner
//
//  Created by Jonas Bark on 06.11.17.
//  Copyright © 2017 The Chromium Authors. All rights reserved.
//

#import <Stripe/Stripe.h>

@class STPAddSourceViewController;
@protocol STPAddSourceViewControllerDelegate;

@interface STPAddSourceViewController : STPAddCardViewController

@property (nonatomic, weak, nullable) id<STPAddSourceViewControllerDelegate> srcDelegate;

@end

/**
 An `STPAddCardViewControllerDelegate` is notified when an `STPAddCardViewController` successfully creates a card token or is cancelled. It has internal error-handling logic, so there's no error case to deal with.
 */
@protocol STPAddSourceViewControllerDelegate <NSObject>

/**
 Called when the user cancels adding a card. You should dismiss (or pop) the view controller at this point.
 
 @param addCardViewController the view controller that has been cancelled
 */
- (void)addCardViewControllerDidCancel:(STPAddSourceViewController *)addCardViewController;

/**
 This is called when the user successfully adds a card and tokenizes it with Stripe. You should send the token to your backend to store it on a customer, and then call the provided `completion` block when that call is finished. If an error occurred while talking to your backend, call `completion(error)`, otherwise, dismiss (or pop) the view controller.
 
 @param addCardViewController the view controller that successfully created a token
 @param token                 the Stripe token that was created. @see STPToken
 @param completion            call this callback when you're done sending the token to your backend
 */
- (void)addCardViewController:(STPAddSourceViewController *)addCardViewController
               didCreateSource:(STPSource *)source
                   completion:(STPErrorBlock)completion;

@end
