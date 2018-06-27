# type Droid : Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
#   primaryFunction: String
# }
module Types
  class DroidType < Types::BaseObject
    description "A robotic character in Star Wars"
    implements GraphQL::Relay::Node.interface
    implements CharacterInterface

    global_id_field :id
    field :name, String, "The name of this droid", null: false
    field :friends, CharacterInterface.connection_type, "Friends of this droid", null: true, connection: true
    field :appears_in, [EpisodeEnum, null: true], "Episodes this droid appears in", null: true
    field :primary_function, String, "What this droid is for", null: true
  end
end
