# interface Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
# }
module Types
  module CharacterInterface
    include Types::BaseInterface
    graphql_name "Character"
    description "A sentient actor in Star Wars"
    field :id, ID, "The unique ID of this person", null: false
    field :name, String, "The name of this person", null: false
    field :friends, CharacterInterface.connection_type, "Friends of this person", null: true, connection: true
    field :appears_in, [EpisodeEnum, null: true], "Episodes this person appears in", method: :appears_in_names, null: true
  end
end
