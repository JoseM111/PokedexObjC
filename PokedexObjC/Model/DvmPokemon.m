#import "DvmPokemon.h"

// Sub class of NSObject
@implementation DvmPokemon

/**©------------------------------------------------------------------------------©*/
- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities spritePath:(NSString *)spritePath {
    // Create the parent before i can create the child
    self = super.init;

    // Check if the parent has been created
    if (self != nil) {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
        _spritePath = spritePath;
    }
    return self;
}
@end

/**©------------------------------------------------------------------------------©*/

@implementation DvmPokemon (JSONConvertible)
// func DvmPokemon initWithDictFunc((NSDictionary:[NSString : id ] )
- (DvmPokemon *)initWithDictFunc:(NSDictionary<NSString *, id> *)topLvlDict {
    // We need to pull from the json:-->> name, id, abilities, sprite
    NSString *name = topLvlDict[@"name"];// subscripting:--? [@"name"]
    // [     ] square brackets just means your accessing a method
    // swift--? let id = tld["id"] as? Int
    NSInteger identifier = [topLvlDict[@"id"] integerValue];
    // let name = tld["name"]
    NSArray *abilitiesOfArrayDict = topLvlDict[@"abilities"];
    // let abilities: [String] = []<<-- Array literal
    NSMutableArray<NSString *> *abilities = NSMutableArray.new ;
    // Hint for Friday
    if ([name isKindOfClass:NSNull.class] || ![abilitiesOfArrayDict isKindOfClass:NSArray.class]) {
        return nil;
    }
    for (NSDictionary *dictionary in abilitiesOfArrayDict) {
        // Accessing the dictionary inside our dictionary array
        NSDictionary *abilityDict = dictionary[@"ability"];
        // To then access our name property
        NSString *nameVal = abilityDict[@"name"];
        [abilities addObject:nameVal];
    }

    // Accessing the sprite
    // Sub scripting another level in one line
    NSString *spritePath = topLvlDict[@"sprites"][@"front_shiny"];

    return [self
            initWithPokemonName:name
                     identifier:identifier
                      abilities:abilities
                     spritePath:spritePath
    ];
}
@end
/**©------------------------------------------------------------------------------©*/
