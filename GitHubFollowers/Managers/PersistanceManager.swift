//
//  PersistanceManager.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/27/22.
//

import Foundation

enum PersistanceActionType {
    case add, remove
}

enum PersistanceManager{
    
    static private let defaults = UserDefaults.standard
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistanceActionType, completed: @escaping (GFError?) -> Void){
        retrieveFavourites { result in
            switch result{
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    retrievedFavorites.append(favorite)
                    
                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }
                completed(save(favorites: retrievedFavorites))
                
                case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavourites(completed: @escaping (Result<[Follower], GFError>) -> Void){
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites  = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToAddToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        
        do{
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            
        } catch {
            return .unableToAddToFavorite
        }
    
        return nil
    }
}
