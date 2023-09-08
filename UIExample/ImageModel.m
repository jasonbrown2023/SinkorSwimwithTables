//
//  ImageModel.m
//  UIExample
//
//  Created by jason brown on 12/06/1402 AP.
//
#import "ImageModel.h"
@interface ImageModel ()

@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSDictionary* imageNameDict;

@end

@implementation ImageModel;

@synthesize imageNames = _imageNames;
@synthesize imageNameDict = _imageNameDict;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    _imageNames = @[@"dads lawn", @"lizard", @"me", @"meandricky", @"miaddadralphie", @"tiffany"];
    
    return _imageNames;
}

-(NSDictionary*) imageNameDict{
    if(!_imageNameDict)
        _imageNameDict = @{@"dads lawn": [UIImage imageNamed:@"dads lawn"],
                           @"lizard": [UIImage imageNamed:@"lizard"],
                           @"me": [UIImage imageNamed:@"me"],
                           @"meandricky": [UIImage imageNamed:@"meandricky"],
                           @"miaddadralphie": [UIImage imageNamed:@"miadadralphie"],
                           @"tiffany": [UIImage imageNamed:@"tiffany"]
                           
        };
    return _imageNameDict;
}


-(UIImage*)getImageWithName:(NSString*)name{
    return self.imageNameDict[name];
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    return self.imageNameDict[self.imageNames[index]];
}

-(NSInteger)numberOfImages{
    return self.imageNameDict.count;
}

-(NSString*)getImageNameForIndex:(NSInteger)index{
    return self.imageNames[index];
}

@end

