#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DvmPokemon.h"

NS_ASSUME_NONNULL_BEGIN
@interface PokemonModelController : NSObject
// MARK: _@
/**©------------------------------------------------------------------------------©*/
+(void) fetchPokemonForSearchTerm:(NSString *)searchTerm // First parameter
                                  completion:(void (^)(DvmPokemon * pokemon))completion; // Second parameter with a closure
/**©------------------------------------------------------------------------------©*/
+(void) fetchImageForPokemon:(DvmPokemon *)pokemon completion:(void (^)(UIImage * image))completion;
/**©------------------------------------------------------------------------------©*/
@end
NS_ASSUME_NONNULL_END
