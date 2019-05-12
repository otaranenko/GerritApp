//
//  SLLChangesTableViewCell.h
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLLChange;
@class SLLAccount;

NS_ASSUME_NONNULL_BEGIN


@interface SLLChangesTableViewCell : UITableViewCell

- (SLLChangesTableViewCell *)setCell:(SLLChangesTableViewCell *)cell ForData:(SLLChange *)changeData withOwner:(SLLAccount *)account;

@end

NS_ASSUME_NONNULL_END
