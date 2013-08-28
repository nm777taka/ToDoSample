// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TDTodo.h instead.

#import <CoreData/CoreData.h>


extern const struct TDTodoAttributes {
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *timeStamp;
	__unsafe_unretained NSString *title;
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




@property (nonatomic, strong) NSString* text;


//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSDate* timeStamp;


//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* title;


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
