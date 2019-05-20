//
//  SLLProjectsTableViewCell.h
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLLProject;

NS_ASSUME_NONNULL_BEGIN


@interface SLLProjectsTableViewCell : UITableViewCell

- (SLLProjectsTableViewCell *)setCell:(SLLProjectsTableViewCell *)cell ForData:(SLLProject *)projectsData;

@end

NS_ASSUME_NONNULL_END
