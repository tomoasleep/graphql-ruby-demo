# type Human : Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
#   homePlanet: String
# }
module Types
  class HumanType < Types::BaseObject
    description "A flesh-and-blood character in Star Wars"
    implements GraphQL::Relay::Node.interface
    implements CharacterInterface

    global_id_field :id
    field :name, String, "The name of this person", null: false
    field :friends, CharacterInterface.connection_type, "Friends of this person", null: true, connection: true
    field :appears_in, [EpisodeEnum, null: true], "Episodes this person appears in", null: true
    field :home_planet, String, "Where this person is from", null: true
  end
end
