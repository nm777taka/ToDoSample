// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TDTodo.m instead.

#import "_TDTodo.h"

const struct TDTodoAttributes TDTodoAttributes = {
	.text = @"text",
	.timeStamp = @"timeStamp",
	.title = @"title",
};

const struct TDTodoRelationships TDTodoRelationships = {
};

const struct TDTodoFetchedProperties TDTodoFetchedProperties = {
};

@implementation TDTodoID
@end

@implementation _TDTodo

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Todo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Todo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Todo" inManagedObjectContext:moc_];
}

- (TDTodoID*)objectID {
	return (TDTodoID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic text;






@dynamic timeStamp;






@dynamic title;











@end
