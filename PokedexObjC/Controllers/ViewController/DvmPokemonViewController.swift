import UIKit

class DvmPokemonViewController: UIViewController {
    
    // MARK: _@IBOutlet
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonSpriteImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIdLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonSearchBar.delegate = self
    }
}// END OF CLASS
/**©------------------------------------------------------------------------------©*/
extension DvmPokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        /**©------------------------------------------------------------------------------©*/
        PokemonModelController.fetchPokemon(forSearchTerm: searchText) { pokemon in
            // Checking if we have a pokemon
            PokemonModelController.fetchImage(for: pokemon) { image in
                /**©-----------------------------©*/
                DispatchQueue.main.async {
                    self.pokemonNameLabel.text = pokemon.name
                    self.pokemonIdLabel.text = "ID: \(String(describing: pokemon.identifier))"
                    self.pokemonAbilitiesLabel.text = "Abilities " + (pokemon.abilities.joined(separator: ", "))
                    self.pokemonSpriteImage.image = image
                }
                /**©-----------------------------©*/
            }
        }
    }
}
