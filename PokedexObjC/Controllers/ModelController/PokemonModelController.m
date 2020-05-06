#import "PokemonModelController.h"

// MARK: _@Magic-Strings 🧙🏾‍♂️
/**©------------------------------------------------------------------------------©*/
static NSString *const baseURLStr = @"https://pokeapi.co/api/v2/pokemon";
/**©------------------------------------------------------------------------------©*/

// CLASS BELOW ⇣⇣⇣⇣⇣
@implementation PokemonModelController
/**©------------------------------------------------------------------------------©*/
+(void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(DvmPokemon * _Nullable pokemon))completion {
    // 1) Base-URL-->>Appending a path component
    NSURL *baseURL = [NSURL URLWithString:baseURLStr];
    NSURL *fullURL = [baseURL URLByAppendingPathComponent:searchTerm.lowercaseString];
    NSLog(@"%@", fullURL);/// Prints out the full url if done correctly

    // 2) Start the datatask
    [[NSURLSession.sharedSession dataTaskWithURL:fullURL
                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // 1) Handle the error
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }

        // 2) Handle the response
        if (response) {
            NSLog(@"%@", response);
        }

        // 3) Handle the data
        if (data) {
            NSDictionary *topLvlDictionary =
                    [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingOptions) 2 error:&error];
            // Check if the top level dictionary worked
            if (!topLvlDictionary) {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }

            DvmPokemon *pokemon = [DvmPokemon.alloc initWithDictFunc:topLvlDictionary];
            completion(pokemon);
        }
    }] resume];

}
/**©------------------------------------------------------------------------------©*/
+ (void)fetchImageForPokemon:(DvmPokemon *)pokemon completion:(void (^)(UIImage * _Nullable image))completion {
    // Step one: URL
    NSURL *imageUrl = [NSURL URLWithString:pokemon.spritePath];
    NSLog(@"%@", imageUrl);

    // Step Two: handle the datatask
    [[NSURLSession.sharedSession dataTaskWithURL:imageUrl completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        // check for error
        if (error != nil) {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        // handle the response

        // handle the data
        if (!data) {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        // Now we have data
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
    }]resume];
}
/**©------------------------------------------------------------------------------©*/
@end
