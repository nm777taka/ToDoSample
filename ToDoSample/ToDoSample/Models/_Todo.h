// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Todo.h instead.

#import <CoreData/CoreData.h>


extern const struct TodoAttributes {
	 NSString *text;
	 NSString *timeStamp;
	 NSString *title;
} TodoAttributes;

extern const struct TodoRelationships {
} TodoRelationships;

extern const struct TodoFetchedProperties {
} TodoFetchedProperties;






@interface TodoID : NSManagedObjectID {}
@end

@interface _Todo : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TodoID*)objectID;




@property (nonatomic, retain) NSString* text;


//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSDate* timeStamp;


//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString* title;


//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _Todo (CoreDataGeneratedAccessors)

@end

@interface _Todo (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;




- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
