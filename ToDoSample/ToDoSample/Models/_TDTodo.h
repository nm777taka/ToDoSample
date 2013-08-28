// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TDTodo.h instead.

#import <CoreData/CoreData.h>


extern const struct TDTodoAttributes {
	 NSString *text;
	 NSString *timeStamp;
	 NSString *title;
} TDTodoAttributes;

extern const struct TDTodoRelationships {
} TDTodoRelationships;

extern const struct TDTodoFetchedProperties {
} TDTodoFetchedProperties;






@interface TDTodoID : NSManagedObjectID {}
@end

@interface _TDTodo : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TDTodoID*)objectID;




@property (nonatomic, retain) NSString* text;


//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSDate* timeStamp;


//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString* title;


//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _TDTodo (CoreDataGeneratedAccessors)

@end

@interface _TDTodo (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;




- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
