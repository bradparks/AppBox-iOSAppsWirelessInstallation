///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBFILESDeleteBatchResult;
@class DBFILESDeleteBatchResultEntry;

#pragma mark - API Object

///
/// The `DeleteBatchResult` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBFILESDeleteBatchResult : NSObject <DBSerializable>

#pragma mark - Instance fields

/// (no description).
@property (nonatomic, readonly) NSArray<DBFILESDeleteBatchResultEntry *> * _Nonnull entries;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param entries (no description).
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithEntries:(NSArray<DBFILESDeleteBatchResultEntry *> * _Nonnull)entries;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DeleteBatchResult` struct.
///
@interface DBFILESDeleteBatchResultSerializer : NSObject

///
/// Serializes `DBFILESDeleteBatchResult` instances.
///
/// @param instance An instance of the `DBFILESDeleteBatchResult` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBFILESDeleteBatchResult` API object.
///
+ (NSDictionary * _Nonnull)serialize:(DBFILESDeleteBatchResult * _Nonnull)instance;

///
/// Deserializes `DBFILESDeleteBatchResult` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBFILESDeleteBatchResult` API object.
///
/// @return An instantiation of the `DBFILESDeleteBatchResult` object.
///
+ (DBFILESDeleteBatchResult * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end