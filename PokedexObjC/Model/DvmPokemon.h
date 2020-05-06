#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DvmPokemon : NSObject
// MARK: _@Properties
/**©------------------------------------------------------------------------------©*/
// let name: String
@property (readonly, nonatomic, copy) NSString *name;
// let identifier: String
// No need for a *pointer because its a primitive & not an object
@property (nonatomic, readonly) NSInteger identifier;
// let abilities: [String]
@property (nonatomic, readonly, copy) NSArray<NSString *> *abilities;
//
@property (nonatomic, readonly, copy) NSString *spritePath;
/**©------------------------------------------------------------------------------©*/
// initializer:--> init
// instancetype: return type could use DvmPokemon or shorthand instancetype
- (instancetype)initWithPokemonName:(NSString *) name
                  identifier:(NSInteger)identifier
                   abilities:(NSArray<NSString *> *)abilities
                  spritePath:(NSString *)spritePath;
/**©------------------------------------------------------------------------------©*/
@end

// swift: extension: DvmPokemon
// extension in Obj-C
@interface DvmPokemon (JSONConvertible)
// Method that takes in a dictionary
- (DvmPokemon *) initWithDictFunc:(NSDictionary<NSString *,  id> *)topLvlDict;
/**©------------------------------------------------------------------------------©*/
@end

NS_ASSUME_NONNULL_END
