//
//  ImageModel.h
//  UIExample
//
//  Created by jason brown on 12/06/1402 AP.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

+(ImageModel*)sharedInstance;

-(UIImage*)getImageWithName:(NSString*)name;
-(UIImage*)getImageWithIndex:(NSInteger)index;
-(NSInteger)numberOfImages;
-(NSString*)getImageNameForIndex:(NSInteger)index;


//@property (strong, nonatomic) NSArray* imageNames;



@end

NS_ASSUME_NONNULL_END
